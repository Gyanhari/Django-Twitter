# Generated by Django 5.0.2 on 2024-02-20 05:29

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0016_post_user_profile'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='post',
            name='user_profile',
        ),
    ]
