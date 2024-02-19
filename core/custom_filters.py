# Create a file named custom_filters.py in your app directory

from django import template

register = template.Library()

@register.filter
def has_image_extension(url):
    image_extensions = ['.jpg', '.jpeg', '.png', '.gif']  # Add more extensions if needed
    return any(url.endswith(ext) for ext in image_extensions)
