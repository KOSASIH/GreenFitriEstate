from django.urls import path
from . import views

urlpatterns = [
    path('payment/', views.PaymentView.as_view(), name='payment'),
    path('payment/success/', views.PaymentSuccessView.as_view(), name='payment_success'),
    path('payment/failure/', views.PaymentFailureView.as_view(), name='payment_failure'),
]
