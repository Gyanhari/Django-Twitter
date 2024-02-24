from django import forms
# from .models import Rating

class RatingForm(forms.Form):
    rating = forms.FloatField(label='Rating', min_value=1, max_value=5)

from django import forms
from .models import Post

class PostForm(forms.ModelForm):
    class Meta:
        model = Post
        fields = ['caption', 'budget']
        widgets = {
            'caption': forms.TextInput(attrs={'placeholder': 'Caption'}),
            'budget': forms.TextInput(attrs={'placeholder': 'Budget'}),
        }


