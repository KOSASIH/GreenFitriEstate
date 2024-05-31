from django.shortcuts import redirect, render
from pi_network.pi_payment import PiPayment

from .forms import PiPaymentForm


def pi_payment_view(request):
    if request.method == "POST":
        form = PiPaymentForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data["username"]
            password = form.cleaned_data["password"]
            recipient_username = form.cleaned_data["recipient_username"]
            amount = form.cleaned_data["amount"]
            pi_payment = PiPayment(username, password)
            if pi_payment.make_payment(recipient_username, amount):
                return redirect("payment_success")
            else:
                return redirect("payment_failure")
    else:
        form = PiPaymentForm()
    return render(request, "pi_payment_form.html", {"form": form})
