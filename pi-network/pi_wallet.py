from.pi_api import PiAPI

class PiWallet:
    def __init__(self, username, password):
        self.username = username
        self.password = password
        self.pi_api = PiAPI("YOUR_API_KEY", "YOUR_API_SECRET")

    def get_balance(self):
        return self.pi_api.get_balance(self.username)

    def send_pi(self, recipient_username, amount):
        return self.pi_api.send_pi(self.username, recipient_username, amount)
