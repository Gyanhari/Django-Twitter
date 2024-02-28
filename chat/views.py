from django.shortcuts import render
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from chat.models import ChatModel
# Create your views here.


@login_required(login_url="signin")
def index(request):
    users = User.objects.exclude(username=request.user.username)
    return render(request, 'chat_index.html', context={'users': users})


@login_required(login_url="signin")
def ChatPage(request, username):
    user_obj = User.objects.get(username=username)
    users = User.objects.exclude(username=request.user.username)

    if request.user.id > user_obj.id:
        thread_name = f'chat_{request.user.id}-{user_obj.id}'
    else:
        thread_name = f'chat_{user_obj.id}-{request.user.id}'
    message_obj = ChatModel.objects.filter(thread_name=thread_name)
    return render(request, 'main_chat.html', context={'users': users, 'user_obj': user_obj, 'messages': message_obj})

