from django.db import models
from django.contrib.auth import get_user_model
import uuid
from datetime import datetime

User = get_user_model()


# Create your models here.
class Profile(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    id_user = models.IntegerField()
    bio = models.TextField(blank=True)
    profileimg = models.ImageField(
        upload_to="profile_images", default="blank-profile-picture.png"
    )
    location = models.CharField(max_length=100, blank=True)

    def __str__(self):
        return self.user.username


class Post(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4)
    user = models.CharField(max_length=100)
    image = models.ImageField(upload_to="post_images")
    caption = models.TextField()
    created_at = models.DateTimeField(default=datetime.now)
    no_of_likes = models.IntegerField(default=0)
    first_name = models.CharField(max_length=100, default=0)
    last_name = models.CharField(max_length=100, default=0)
    approved = models.BooleanField(default=False)
    # budget = models.DecimalField(
    #     max_digits=10, decimal_places=2, null=True, blank=True
    # )  # Add the budget field

    def __str__(self):
        return self.user


class LikePost(models.Model):
    post_id = models.CharField(max_length=500)
    username = models.CharField(max_length=100)

    def __str__(self):
        return self.username


class FollowersCount(models.Model):
    follower = models.CharField(max_length=100)
    user = models.CharField(max_length=100)

    def __str__(self):
        return self.user


# class PostApproval(models.Model):
#     post = models.ForeignKey(Post, on_delete=models.CASCADE)
#     approved = models.BooleanField(default=False)

#     def __str__(self):
#         return f"Post: {self.post_id}, Approved: {self.approved}"


# class ApprovedPost(models.Model):
#     user = models.ForeignKey(User, on_delete=models.CASCADE)
#     caption = models.CharField(max_length=255)
#     image = models.ImageField(upload_to='posts/')
#     # Other fields and methods as needed...

#     def __str__(self):
#         return self.caption


class PendingPost(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    caption = models.CharField(max_length=255)
    image = models.ImageField(upload_to="posts/")
    approved = models.BooleanField(default=False)

    def __str__(self):
        return self.caption


class Comment(models.Model):
    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    text = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    profile = models.ForeignKey(Profile, on_delete=models.CASCADE)  # ForeignKey relationship with Profile model

    def __str__(self):
      return f"Comment by {self.user.username} on {self.post.caption}"
