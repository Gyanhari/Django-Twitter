import random
from itertools import chain
from django.contrib.sessions.models import Session
from django.utils import timezone
from dateutil.parser import parse
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User, auth
from django.shortcuts import render, redirect, get_object_or_404
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.admin.views.decorators import staff_member_required
from .models import Profile, Post, LikePost, FollowersCount, Comment, ViewedPost, FollowingsCount, Rating, PostImage, PostAttachment
from django.db.models import Q
from django.urls import reverse
from .forms import RatingForm
from django.db.models import Avg
from django.http import JsonResponse

from django.shortcuts import get_object_or_404

@login_required(login_url="signin")
def index(request):
    try:
        user_object = User.objects.get(username=request.user.username)
        try:
            user_profile = Profile.objects.get(user=user_object)
        except Profile.DoesNotExist:
            user_profile = Profile.objects.create(user=user_object)

        user_email = user_object.email
        user_profile_image_url = user_profile.profileimg.url 
    except User.DoesNotExist:
        pass
    except Profile.DoesNotExist:
        user_profile = Profile.objects.create(user=user_object)
        user_email = ""
        user_profile_image_url = ""  

    user_following_list = []
    feed = []

    user_following = FollowersCount.objects.filter(follower=request.user.username)

    # Filter approved posts for followed users
    for user_followed in user_following:
        feed_lists = Post.objects.filter(
            user=user_followed.user, approved=True
        )
        feed.extend(feed_lists)

    feed_list = list(feed)

    # Fetching budget for each post
    budgets = [post.budget for post in feed_list]

    feed_list = [post for post in feed_list if post.user != request.user]

    for post in feed_list:
        post.comment_count = Comment.objects.filter(post=post).count()
        post.view_count = post.view_count  # Assuming view_count is already present in the Post model

        post_user_profile = Profile.objects.get(user__username=post.user)
        post.user_profile_image_url = post_user_profile.profileimg.url

        # Retrieve images and attachments associated with the post
        post_images = PostImage.objects.filter(post=post)
        post_attachments = PostAttachment.objects.filter(post=post)
        post.post_images = post_images
        post.post_attachments = post_attachments

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
        profile_lists = Profile.objects.filter(user_id=ids)
        username_profile_list.append(profile_lists)

    suggestions_username_profile_list = list(chain(*username_profile_list))

    if request.method == "POST":
        # Handling comment submission
        user = request.user
        text = request.POST.get("comment_text")
        
        # Determine the post for which the rating is being submitted
        post_id = request.POST.get("post_id")  # Assuming you have a hidden input field in your form containing the post ID
        post = get_object_or_404(Post, id=post_id)

        # Handling rating submission
        rating_form = RatingForm(request.POST)
        if rating_form.is_valid():
            rating = rating_form.cleaned_data['rating']  # Get the rating value from the form data
            Rating.objects.update_or_create(post=post, user=user, defaults={'rating': rating})  # Update or create the Rating object
            messages.success(request, "Rating submitted successfully.")
        else:
            messages.error(request, "Invalid rating form. Please try again.")

    else:
        rating_form = RatingForm()

    # Calculate average rating for each post
    average_ratings = {}
    for post in feed_list:
        average_rating = Rating.objects.filter(post=post).aggregate(Avg('rating'))['rating__avg'] or 0
        average_ratings[post.id] = average_rating

    # Sort the posts based on their average ratings (highest first)
    sorted_posts = sorted(feed_list, key=lambda post: average_ratings.get(post.id, 0), reverse=True)

    return render(
        request,
        "index.html",
        {
            "user_profile": user_profile,
            "user_email": user_email,
            "user_profile_image_url": user_profile_image_url,
            "posts": feed_list,
            "suggestions_username_profile_list": suggestions_username_profile_list[:4],
            "budgets": budgets,
            "rating_form": rating_form,
            "average_ratings": average_ratings,  # Pass average ratings to the template context
            "sorted_posts": sorted_posts,
        },
    )







@login_required(login_url="signin")
def upload(request):
    if request.method == "POST":
        user = request.user.username
        caption = request.POST.get("caption")
        first_name = request.user.first_name
        last_name = request.user.last_name
        budget = request.POST.get('budget')
        images = request.FILES.getlist("image_upload")  # Get multiple image files
        attachments = request.FILES.getlist("file_upload")  # Get multiple attachment files
        
        # Create a post even if caption is not provided
        new_post = Post.objects.create(
            user=user,
            caption=caption,
            first_name=first_name,
            last_name=last_name,
            budget=budget,
        )
        # Save each image to the database
        for image in images:
            PostImage.objects.create(post=new_post, image=image)
        # Save each attachment to the database
        for attachment in attachments:
            PostAttachment.objects.create(post=new_post, attachment=attachment)
        
        return redirect("/")

    return render(request, "upload_form.html")  # Add your upload form template here






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
            profile_lists = Profile.objects.filter(user_id=ids)
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
    user_posts = Post.objects.filter(user=pk, approved=True)
    user_post_length = user_posts.count()
    user_email = request.user.email
    
    # Fetch followers and following users
    followers = FollowersCount.objects.filter(user=pk).values_list("follower", flat=True)
    following = FollowersCount.objects.filter(follower=pk).values_list("user", flat=True)

    # Fetch User objects for followers and following users
    follower_users = User.objects.filter(username__in=followers)
    following_users = User.objects.filter(username__in=following)

    # Calculate total view count for all posts of the user
    total_view_count = sum(post.view_count for post in user_posts)

    # Check if the logged-in user is viewing their own profile
    if request.user.username == pk:
        # If the logged-in user is viewing their own profile, show all approved posts
        user_posts_to_display = user_posts
        user_profile_picture_url = user_profile.profileimg.url  # Profile image URL of the logged-in user
    else:
        # If the logged-in user is viewing another user's profile
        # Check if the user is followed
        if FollowersCount.objects.filter(follower=request.user.username, user=pk).exists():
            # If the user is followed, show all posts
            user_posts_to_display = user_posts
        else:
            # If the user is not followed, show only approved posts
            user_posts_to_display = user_posts.order_by("-created_at")[:4]
        visited_user_profile = Profile.objects.get(user=request.user)  
        user_profile_picture_url = visited_user_profile.profileimg.url  

    for post in user_posts_to_display:
        post.comment_count = Comment.objects.filter(post=post).count()
        post_images = PostImage.objects.filter(post=post)
        post_attachments = PostAttachment.objects.filter(post=post)
        post.post_images = post_images
        post.post_attachments = post_attachments

    user_followers = len(FollowersCount.objects.filter(user=pk))
    user_following = len(FollowersCount.objects.filter(follower=pk))

    if request.user.username != pk:
        if FollowersCount.objects.filter(follower=request.user.username, user=pk).exists():
            button_text = "Unfollow"
        else:
            button_text = "Follow"
    else:
        button_text = None

    if request.method == "POST":
        # Handling comment submission
        user = request.user
        text = request.POST.get("comment_text")
        
        # Handling rating submission
        rating_form = RatingForm(request.POST)
        if rating_form.is_valid():
            # Get the post ID from the form data
            post_id = rating_form.cleaned_data['post_id']
            # Retrieve the corresponding post
            post = Post.objects.get(pk=post_id)
            # Get the rating value from the form data
            rating = rating_form.cleaned_data['rating']
            # Create and save the Rating object
            Rating.objects.create(post=post, user=user, rating=rating)
            messages.success(request, "Rating submitted successfully.")
        else:
            messages.error(request, "Invalid rating form. Please try again.")
    else:
        rating_form = RatingForm()
        
    # Fetching budget for each post
    budgets = [post.budget for post in user_posts]
    # Calculate average rating for each post
    average_ratings = {}
    for post in user_posts_to_display:
        average_rating = Rating.objects.filter(post=post).aggregate(Avg('rating'))['rating__avg'] or 0
        average_ratings[post.id] = average_rating

    context = {
        "user_object": user_object,
        "user_profile": user_profile,
        "user_posts": user_posts_to_display,
        "user_post_length": user_post_length,
        "user_followers": user_followers,
        "user_following": user_following,
        "followers": follower_users,
        "following": following_users,
        "button_text": button_text,  
        "user_profile_picture_url": user_profile_picture_url,  
        "total_view_count": total_view_count,  # Include total view count in the context
        "budgets": budgets,
        "user_email" : user_email,
        "rating_form": rating_form,
        "average_ratings": average_ratings,  # Pass average ratings to the template context
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
        # Fetch the users who are following the logged-in user
        user_followers = FollowersCount.objects.filter(user=request.user).values_list("follower__username", flat=True)

        # Fetch the users whom the logged-in user is following
        user_following = FollowersCount.objects.filter(follower=request.user.username).values_list("user__username", flat=True)

        # Fetch the User objects for followers and following users
        followers = User.objects.filter(username__in=user_followers)
        following = User.objects.filter(username__in=user_following)

        context = {
            "followers": followers,
            "following": following,
        }
        return render(request, "follow.html", context)



@login_required(login_url="signin")
def settings(request):
    user_profile = Profile.objects.get(user=request.user)

    if request.method == "POST":

        if request.FILES.get("image") == None:
            image = user_profile.profileimg
            bio = request.POST["bio"]
            # email = request.POST["email"]
            location = request.POST["location"]

            user_profile.profileimg = image
            user_profile.bio = bio
            # user_profile.email = email
            user_profile.location = location
            user_profile.save()
        if request.FILES.get("image") != None:
            image = request.FILES.get("image")
            bio = request.POST["bio"]
            # email = request.POST["email"]
            location = request.POST["location"]

            user_profile.profileimg = image
            user_profile.bio = bio
            # user_profile.email = email
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

                user_login = auth.authenticate(username=username, password=password)
                auth.login(request, user_login)

                user_model = User.objects.get(username=username)
                new_profile = Profile.objects.create(user=user_model)

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
            pass

    # Fetch all pending posts
    pending_posts = Post.objects.filter(approved=False)

    # Fetch all approved posts
    approved_posts = Post.objects.filter(approved=True)

    # Fetch images and attachments associated with each pending post
    for post in pending_posts:
        post.post_images = PostImage.objects.filter(post=post)
        post.post_attachments = PostAttachment.objects.filter(post=post)

    # Fetch images and attachments associated with each approved post
    for post in approved_posts:
        post.post_images = PostImage.objects.filter(post=post)
        post.post_attachments = PostAttachment.objects.filter(post=post)

    return render(
        request,
        "admin_approval.html",
        {"pending_posts": pending_posts, "approved_posts": approved_posts},
    )


@staff_member_required
def approved_post(request):
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
            pass

    # Fetch all approved posts
    approved_posts = Post.objects.filter(approved=True)

    # Fetch images and attachments associated with each post
    for post in approved_posts:
        post.post_images = PostImage.objects.filter(post=post)
        post.post_attachments = PostAttachment.objects.filter(post=post)

    return render(
        request,
        "approved_post.html",
        { "approved_posts": approved_posts }
    )




from django.contrib.auth.models import User

@staff_member_required
def delete_user(request):
    if request.method == "POST":
        user_id = request.POST.get("user_id")
        
        try:
            user = User.objects.get(id=user_id)
            user.delete()
        except User.DoesNotExist:
            pass

    # Exclude the superuser from the list of users
    users = User.objects.exclude(is_superuser=True)
    
    return render(
        request,
        "delete_user_admin.html",
        {"users": users},
    )

@staff_member_required
def user_posts(request, user_id):
    user = get_object_or_404(User, id=user_id)
    user_posts = Post.objects.filter(user=user)
    user_profile = get_object_or_404(Profile, user=user)
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
            pass


    pending_posts = Post.objects.all()


    approved_posts = pending_posts.filter(approved=True)
    pending_posts = pending_posts.filter(approved=False)

    
    # Fetch images and attachments associated with each post
    for post in user_posts:
        post.post_images = PostImage.objects.filter(post=post)
        post.post_attachments = PostAttachment.objects.filter(post=post)
    
    return render(request, "user_posts.html", {"user": user, "user_profile": user_profile, "user_posts": user_posts,"pending_posts": pending_posts, "approved_posts": approved_posts})



from django.db.models import Avg

from django.shortcuts import redirect

from django.shortcuts import redirect

@login_required(login_url="signin")
def add_comment(request, post_id):
    post = get_object_or_404(Post, id=post_id)
    comments = Comment.objects.filter(post=post)
    comment_count = comments.count()  
    
    # Check if the user has already viewed this post during this session
    session_key = request.session.session_key
    viewed_posts = request.session.get('viewed_posts', [])

    # Check if the user has already viewed this post recently
    user = request.user
    if not ViewedPost.objects.filter(post=post, user=user, viewed_at__gte=timezone.now() - timezone.timedelta(days=1)).exists():
        # Increment the view count of the post
        post.view_count += 1
        post.save()

        # Record the view in the database   
        viewed_post = ViewedPost.objects.create(post=post, user=user)
        viewed_post.save()

    logged_in_user_profile_picture_url = Profile.objects.get(user=request.user).profileimg.url
    
    post_user_profile_picture_url = None  

    if request.method == "POST":
        # Handling comment submission
        user = request.user
        text = request.POST.get("comment_text")
        
        if not text:  
            # messages.error(request, "Please fill in the comment field.")
            pass
        else:
            profile = Profile.objects.get(user=user)
            post_user_profile_picture_url = profile.profileimg.url
            comment = Comment.objects.create(post=post, user=user, text=text, profile=profile)
            comment.save()
            
            comments = Comment.objects.filter(post=post)
            comment_count = comments.count()

        # Handling rating submission
        rating_form = RatingForm(request.POST)
        if rating_form.is_valid():
            rating = rating_form.cleaned_data['rating']  # Get the rating value from the form data
            Rating.objects.create(post=post, user=user, rating=rating)  # Create and save the Rating object
            # messages.success(request, "Rating submitted successfully.")
        else:
            # messages.error(request, "Invalid rating form. Please try again.")
            pass

    else:
        rating_form = RatingForm()

    # Fetch images and attachments associated with the post
    post_images = PostImage.objects.filter(post=post)
    post_attachments = PostAttachment.objects.filter(post=post)
    
    # Calculate average rating for the post
    average_rating = Rating.objects.filter(post=post).aggregate(Avg('rating'))['rating__avg'] or 0
    
    # Pass the rating form instance, average rating, images, and attachments to the template context
    return render(request, "comment.html", {
        "post": post, 
        "comments": comments, 
        "comment_count": comment_count,
        "logged_in_user_profile_picture_url": logged_in_user_profile_picture_url,
        "post_user_profile_picture_url": post_user_profile_picture_url,
        "budget": post.budget,
        "rating_form": rating_form,
        "average_rating": average_rating,
        "post_images": post_images,
        "post_attachments": post_attachments,
    })













from django.contrib import messages

@login_required(login_url="signin")
def delete_post(request, post_id):
    post = get_object_or_404(Post, id=post_id)
    
    # Check if the post belongs to the logged-in user
    if post.user == request.user.username:
        # Delete the post
        post.delete()
        messages.success(request, "Post deleted successfully.")
    else:
        messages.error(request, "You are not authorized to delete this post.")
    
    return redirect("profile", pk=request.user.username)

@login_required(login_url="signin")
def delete_comment(request, comment_id):
    comment = get_object_or_404(Comment, id=comment_id)
    
    # Check if the comment belongs to the logged-in user
    if comment.user == request.user:
        # Delete the comment
        comment.delete()
        messages.success(request, "Comment deleted successfully.")
    else:
        messages.error(request, "You are not authorized to delete this comment.")
    
    # Redirect back to the post detail page or any appropriate page
    return redirect(reverse("comment", kwargs={"post_id": comment.post.id}))




@staff_member_required
def post_details(request, post_id,user_id):
    post = get_object_or_404(Post, id=post_id)
    comments = Comment.objects.filter(post=post)
    likes = LikePost.objects.filter(post_id=post_id)
    user = get_object_or_404(User, id=user_id)
    user_posts = Post.objects.filter(user=user)
    user_profile = get_object_or_404(Profile, user=user)
    
    # Fetch user information for each like
    liked_users = User.objects.filter(username__in=[like.username for like in likes])

    # Combine user information with likes
    likes_with_users = [(like, liked_users.get(username=like.username)) for like in likes]

    if request.method == 'POST':
        action = request.POST.get('action')
        if action == 'delete_comment':
            comment_id = request.POST.get('comment_id')
            comment = get_object_or_404(Comment, id=comment_id)
            comment.delete()
        elif action == 'like_post':
            user_id = request.user.id
            liked = LikePost.objects.filter(post_id=post_id, user_id=user_id).exists()
            if not liked:
                like = LikePost.objects.create(post_id=post_id, user_id=user_id)
                like.save()
        elif action == 'delete_post':
            post.delete()
            return redirect(delete_user)


    return render(
        request,
        "post_details.html",
        {"post": post, "comments": comments, "likes": likes_with_users,"user_profile": user_profile}
    )


# def get_followers(request):
#     user_followers = FollowersCount.objects.filter(user=request.user).values_list("follower__username", flat=True)
#     followers = list(user_followers)
#     return JsonResponse({"followers": followers})

# def get_following(request):
#     user_following = FollowersCount.objects.filter(follower=request.user.username).values_list("user__username", flat=True)
#     following = list(user_following)
#     return JsonResponse({"following": following})

@login_required
def followers_popup(request):
    user_followers = FollowersCount.objects.filter(user=request.user.username)
    context = {
        'user_followers': user_followers,
    }
    return render(request, 'followers_popup.html', context)

@login_required
def following_popup(request):
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
        # Fetch the users who are following the logged-in user
        user_followers = FollowersCount.objects.filter(user=request.user).values_list("follower", flat=True)

        # Fetch the users whom the logged-in user is following
        user_following = FollowersCount.objects.filter(follower=request.user.username).values_list("user", flat=True)

        # Fetch the User objects for followers and following users
        followers = User.objects.filter(username__in=user_followers)
        following = User.objects.filter(username__in=user_following)

        context = {
            "followers": followers,
            "following": following,
        }
        return render(request, "following_popup.html", context)



def post_viewers(request, post_id):
    post = get_object_or_404(Post, id=post_id)
    viewers = post.viewers.all()
    return render(request, 'post_viewers.html', {'post': post, 'viewers': viewers})



