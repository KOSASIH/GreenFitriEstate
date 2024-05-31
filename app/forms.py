from django import forms
from .models import PaymentMethod

class PaymentForm(forms.Form):
    payment_method = forms.ModelChoiceField(queryset=PaymentMethod.objects.all())
    amount = forms.DecimalField(max_digits=10, decimal_places=2)
