import random
from itertools import chain

from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User, auth
from django.shortcuts import render, redirect, get_object_or_404
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.admin.views.decorators import staff_member_required


from .models import Profile, Post, LikePost, FollowersCount, Comment


# Create your views here.


from django.db.models import Q

@login_required(login_url="signin")
def index(request):
    try:
        user_object = User.objects.get(username=request.user.username)
        user_profile = Profile.objects.get(user=user_object)
        user_email = user_object.email
    except Profile.DoesNotExist:
        # If the profile doesn't exist, create a new one
        user_profile = Profile.objects.create(user=user_object)
        user_email = ""
    user_following_list = []
    feed = []

    user_following = FollowersCount.objects.filter(follower=request.user.username)

    # Filter approved posts for followed users
    for user_followed in user_following:
        feed_lists = Post.objects.filter(
            user=user_followed.user, approved=True
        )
        feed.extend(feed_lists)

    # Convert the feed queryset to a list
    feed_list = list(feed)

    # Exclude posts uploaded by the currently logged-in user
    feed_list = [post for post in feed_list if post.user != request.user]

    # user suggestion starts
    all_users = User.objects.all()
    user_following_all = []

    for user in user_following:
        user_list = User.objects.get(username=user.user)
        user_following_all.append(user_list)

    new_suggestions_list = [
        x for x in list(all_users) if (x not in list(user_following_all))
    ]
    current_user = User.objects.filter(username=request.user.username)
    final_suggestions_list = [
        x for x in list(new_suggestions_list) if (x not in list(current_user))
    ]
    random.shuffle(final_suggestions_list)

    username_profile = []
    username_profile_list = []

    for users in final_suggestions_list:
        username_profile.append(users.id)

    for ids in username_profile:
        profile_lists = Profile.objects.filter(id_user=ids)
        username_profile_list.append(profile_lists)

    suggestions_username_profile_list = list(chain(*username_profile_list))

    return render(
        request,
        "index.html",
        {
            "user_profile": user_profile,
            "user_email": user_email,
            "posts": feed_list,
            "suggestions_username_profile_list": suggestions_username_profile_list[:4],
        },
    )



@login_required(login_url="signin")
def upload(request):
    if request.method == "POST":
        user = request.user.username
        image = request.FILES.get("image_upload")
        caption = request.POST.get("caption")
        first_name = request.user.first_name
        last_name = request.user.last_name

        if image or caption:
            new_post = Post.objects.create(
                user=user,
                image=image,
                caption=caption,
                first_name=first_name,
                last_name=last_name,
            )
            new_post.save()

        return redirect("/")


@login_required(login_url="signin")
def search(request):
    user_object = User.objects.get(username=request.user.username)
    user_profile = Profile.objects.get(user=user_object)

    if request.method == "POST":
        username = request.POST["username"]
        username_object = User.objects.filter(username__icontains=username)

        username_profile = []
        username_profile_list = []

        for users in username_object:
            username_profile.append(users.id)

        for ids in username_profile:
            profile_lists = Profile.objects.filter(id_user=ids)
            username_profile_list.append(profile_lists)

        username_profile_list = list(chain(*username_profile_list))
    return render(
        request,
        "search.html",
        {"user_profile": user_profile, "username_profile_list": username_profile_list},
    )


@login_required(login_url="signin")
def like_post(request):
    username = request.user.username
    post_id = request.GET.get("post_id")

    post = Post.objects.get(id=post_id)

    like_filter = LikePost.objects.filter(post_id=post_id, username=username).first()

    if like_filter == None:
        new_like = LikePost.objects.create(post_id=post_id, username=username)
        new_like.save()
        post.no_of_likes = post.no_of_likes + 1
        post.save()
        return redirect("/")
    else:
        like_filter.delete()
        post.no_of_likes = post.no_of_likes - 1
        post.save()
        return redirect("/")


@login_required(login_url="signin")
def profile(request, pk):
    user_object = User.objects.get(username=pk)
    user_profile = Profile.objects.get(user=user_object)
    user_posts = Post.objects.filter(user=pk)
    user_post_length = Post.objects.filter(approved=True).count()

    follower = request.user.username
    user = pk

     # Fetch followers and following users
    followers = FollowersCount.objects.filter(user=pk).values_list("follower", flat=True)
    following = FollowersCount.objects.filter(follower=pk).values_list("user", flat=True)

    # Fetch User objects for followers and following users
    follower_users = User.objects.filter(username__in=followers)
    following_users = User.objects.filter(username__in=following)

    # Check if the current user is following the profile user
    if FollowersCount.objects.filter(follower=follower, user=user).exists():
        # If the user is followed, show all posts
        user_posts_to_display = user_posts
    else:
        # If the user is not followed, show the latest 4 posts
        user_posts_to_display = user_posts.order_by("-created_at")[:4]

    user_followers = len(FollowersCount.objects.filter(user=pk))
    user_following = len(FollowersCount.objects.filter(follower=pk))

    context = {
        "user_object": user_object,
        "user_profile": user_profile,
        "user_posts": user_posts_to_display,
        "user_post_length": user_post_length,
        "user_followers": user_followers,
        "user_following": user_following,
        "followers": follower_users,
        "following": following_users,
    }
    return render(request, "profile.html", context)


@login_required(login_url="signin")
def follow(request):
    if request.method == "POST":
        follower = request.POST["follower"]
        user = request.POST["user"]

        if FollowersCount.objects.filter(follower=follower, user=user).first():
            delete_follower = FollowersCount.objects.get(follower=follower, user=user)
            delete_follower.delete()
            return redirect("/profile/" + user)
        else:
            new_follower = FollowersCount.objects.create(follower=follower, user=user)
            new_follower.save()
            return redirect("/profile/" + user)
    else:
        return redirect("/")


@login_required(login_url="signin")
def settings(request):
    user_profile = Profile.objects.get(user=request.user)

    if request.method == "POST":

        if request.FILES.get("image") == None:
            image = user_profile.profileimg
            bio = request.POST["bio"]
            location = request.POST["location"]

            user_profile.profileimg = image
            user_profile.bio = bio
            user_profile.location = location
            user_profile.save()
        if request.FILES.get("image") != None:
            image = request.FILES.get("image")
            bio = request.POST["bio"]
            location = request.POST["location"]

            user_profile.profileimg = image
            user_profile.bio = bio
            user_profile.location = location
            user_profile.save()

        return redirect("settings")
    return render(request, "setting.html", {"user_profile": user_profile})


def signup(request):
    if request.method == "POST":
        first_name = request.POST["first_name"]
        last_name = request.POST["last_name"]
        username = request.POST["username"]
        email = request.POST["email"]
        password = request.POST["password"]
        password2 = request.POST["password2"]

        if password == password2:
            if User.objects.filter(email=email).exists():
                messages.info(request, "Email Taken")
                return redirect("signup")
            elif User.objects.filter(username=username).exists():
                messages.info(request, "Username Taken")
                return redirect("signup")
            else:
                user = User.objects.create_user(
                    username=username,
                    email=email,
                    password=password,
                    first_name=first_name,
                    last_name=last_name,
                )
                user.save()

                # log user in and redirect to settings page
                user_login = auth.authenticate(username=username, password=password)
                auth.login(request, user_login)

                # create a Profile object for the new user
                user_model = User.objects.get(username=username)
                new_profile = Profile.objects.create(
                    user=user_model, id_user=user_model.id
                )
                new_profile.save()
                return redirect("settings")
        else:
            messages.info(request, "Password Not Matching")
            return redirect("signup")

    else:
        return render(request, "signup.html")


def signin(request):
    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]

        user = auth.authenticate(username=username, password=password)

        if user is not None:
            auth.login(request, user)
            return redirect("/")
        else:
            messages.info(request, "Credentials Invalid")
            return redirect("signin")

    else:
        return render(request, "signin.html")


@login_required(login_url="signin")
def logout(request):
    auth.logout(request)
    return redirect("signin")


@staff_member_required
def admin_approval(request):
    if request.method == "POST":
        post_id = request.POST.get("post_id")
        action = request.POST.get("action")  # 'approve' or 'reject'

        try:
            post = Post.objects.get(id=post_id)

            if action == "approve":
                post.approved = True
                post.save()
            elif action == "reject":
                post.delete()  # Or any other action you want for rejection

        except ObjectDoesNotExist:
            # Handle the case where the post does not exist
            pass

    # Filter all PendingPost objects
    pending_posts = Post.objects.all()

    # Separate pending posts into approved and not approved
    approved_posts = pending_posts.filter(approved=True)
    pending_posts = pending_posts.filter(approved=False)

    return render(
        request,
        "admin_approval.html",
        {"pending_posts": pending_posts, "approved_posts": approved_posts},
    )


@login_required(login_url="signin")
def add_comment(request, post_id):
    post = get_object_or_404(Post, id=post_id)
    comments = Comment.objects.filter(post=post)
    
    if request.method == "POST":
        user = request.user
        text = request.POST.get("comment_text")
        
        if not text:  # Check if the comment text is empty
            messages.error(request, "Please fill in the comment field.")
        else:
            # Get the user's profile
            profile = Profile.objects.get(user=user)
            
            # Create the comment with the user's profile image
            comment = Comment.objects.create(post=post, user=user, text=text, profile=profile)
            comment.save()
            
            # After saving the new comment, refresh the comments queryset
            comments = Comment.objects.filter(post=post)
    
    return render(request, "comment.html", {"post": post, "comments": comments})
