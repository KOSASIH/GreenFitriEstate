import os

import django
from django.core.management import execute_from_command_line
from pi_network.pi_api import PiAPI
from pi_network.pi_payment import PiPayment
from pi_network.pi_wallet import PiWallet

# Set up Django environment
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "GreenFitriEstate.settings")
django.setup()


# Define a custom management command to interact with Pi Network
class PiNetworkCommand:
    def __init__(self):
        self.pi_api = PiAPI("YOUR_API_KEY", "YOUR_API_SECRET")
        self.pi_wallet = PiWallet("YOUR_USERNAME", "YOUR_PASSWORD")
        self.pi_payment = PiPayment("YOUR_USERNAME", "YOUR_PASSWORD")

    def get_balance(self):
        return self.pi_wallet.get_balance()

    def send_pi(self, recipient_username, amount):
        return self.pi_payment.make_payment(recipient_username, amount)

    def list_transactions(self):
        return self.pi_api.get_transactions()


# Define a custom management command to run the Pi Network payment gateway
class RunPiPaymentGatewayCommand:
    def __init__(self):
        self.pi_payment_gateway = PiPaymentGateway()

    def handle(self, *args, **options):
        self.pi_payment_gateway.run()


# Define a custom management command to run the Pi Network wallet
class RunPiWalletCommand:
    def __init__(self):
        self.pi_wallet = PiWallet("YOUR_USERNAME", "YOUR_PASSWORD")

    def handle(self, *args, **options):
        self.pi_wallet.run()


# Define the main management command
def main():
    # Create a PiNetworkCommand instance
    pi_network_command = PiNetworkCommand()

    # Add custom management commands
    commands = {
        "pi_network": pi_network_command,
        "run_pi_payment_gateway": RunPiPaymentGatewayCommand(),
        "run_pi_wallet": RunPiWalletCommand(),
    }

    # Execute the management command
    execute_from_command_line(commands)


if __name__ == "__main__":
    main()
