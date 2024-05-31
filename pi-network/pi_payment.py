from .pi_wallet import PiWallet


class PiPayment:
    def __init__(self, username, password):
        self.pi_wallet = PiWallet(username, password)

    def make_payment(self, recipient_username, amount):
        balance = self.pi_wallet.get_balance()
        if balance >= amount:
            self.pi_wallet.send_pi(recipient_username, amount)
            return True
        return False
