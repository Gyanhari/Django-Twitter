from django.urls import path,  re_path
from . import views
from .views import delete_post

urlpatterns = [
    path('', views.index, name='index'),
    path('settings', views.settings, name='settings'),
    path('upload', views.upload, name='upload'),
    path('follow', views.follow, name='follow'),
    path('search', views.search, name='search'),
    path('profile/<str:pk>/', views.profile, name='profile'),
    path('like-post', views.like_post, name='like-post'),
    path('signup', views.signup, name='signup'),
    path('signin', views.signin, name='signin'),
    path('logout', views.logout, name='logout'),
    path('admin_approval', views.admin_approval, name='admin_approval'),
    re_path(r'^comment/(?P<post_id>[\w-]+)/$', views.add_comment, name='comment'),
    path('delete/<uuid:post_id>/', delete_post, name='delete_post'),
    path('comment/delete/<int:comment_id>/', views.delete_comment, name='delete_comment'),
    path('delete_user', views.delete_user, name='delete_user'),
    path('post_details/<uuid:post_id>/', views.post_details, name='post_details'),
    path('user_posts/<int:user_id>/', views.user_posts, name='user_posts'),
    # path('viewed_users/<uuid:post_id>/', views.viewed_users, name='viewed_users'),
    # path('verify-otp/<int:user_id>/', verify_otp, name='verify_otp'),  
    path('followers_popup/', views.followers_popup, name='followers_popup'),
    path('following_popup/', views.following_popup, name='following_popup'), 
    path('post/<uuid:post_id>/viewers/', views.post_viewers, name='post_viewers'),
    # path('rate/<int:post_id>/<int:rating>/', views.rate, name='rate'),
]