from django import forms

class RatingForm(forms.Form):
    rating = forms.FloatField(label='Rating', min_value=1, max_value=5)
