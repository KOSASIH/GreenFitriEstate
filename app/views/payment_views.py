from django.shortcuts import render, redirect
from django.views.generic import View
from .models import Payment, PaymentMethod
from .forms import PaymentForm
import stripe

stripe.api_key = 'YOUR_STRIPE_SECRET_KEY'

class PaymentView(View):
    template_name = 'payment/index.html'

    def get(self, request):
        payment_methods = PaymentMethod.objects.all()
        return render(request, self.template_name, {'payment_methods': payment_methods})

    def post(self, request):
        form = PaymentForm(request.POST)
        if form.is_valid():
            payment_method = form.cleaned_data['payment_method']
            amount = form.cleaned_data['amount']
            payment = Payment(payment_method=payment_method, amount=amount)
            payment.save()

            if payment_method.name == 'BCA':
                # BCA payment gateway integration
                payment_intent = stripe.PaymentIntent.create(
                    amount=amount,
                    currency='idr',
                    payment_method_types=['bca_va'],
                )
                payment.transaction_id = payment_intent.id
                payment.save()
                return redirect('payment_success')

            elif payment_method.name == 'BNI':
                # BNI payment gateway integration
                payment_intent = stripe.PaymentIntent.create(
                    amount=amount,
                    currency='idr',
                    payment_method_types=['bni_va'],
                )
                payment.transaction_id = payment_intent.id
                payment.save()
                return redirect('payment_success')

            elif payment_method.name == 'BRI':
                # BRI payment gateway integration
                payment_intent = stripe.PaymentIntent.create(
                    amount=amount,
                    currency='idr',
                    payment_method_types=['bri_va'],
                )
                payment.transaction_id = payment_intent.id
                payment.save()
                return redirect('payment_success')

            # Add more payment gateways as needed

            else:
                return redirect('payment_failure')

        return render(request, self.template_name, {'form': form})

class PaymentSuccessView(View):
    template_name = 'payment/success.html'

    def get(self, request):
        return render(request, self.template_name)

class PaymentFailureView(View):
    template_name = 'payment/failure.html'

    def get(self, request):
        return render(request, self.template_name)
