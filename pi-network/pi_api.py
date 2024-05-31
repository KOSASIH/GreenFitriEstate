import requests


class PiAPI:
    def __init__(self, api_key, api_secret):
        self.api_key = api_key
        self.api_secret = api_secret
        self.base_url = "https://api.pi.network/v1"

    def get_balance(self, username):
        headers = {"X-API-KEY": self.api_key, "X-API-SECRET": self.api_secret}
        response = requests.get(
            f"{self.base_url}/users/{username}/balance", headers=headers
        )
        return response.json()

    def send_pi(self, sender_username, recipient_username, amount):
        headers = {"X-API-KEY": self.api_key, "X-API-SECRET": self.api_secret}
        data = {
            "sender_username": sender_username,
            "recipient_username": recipient_username,
            "amount": amount,
        }
        response = requests.post(
            f"{self.base_url}/transactions", headers=headers, json=data
        )
        return response.json()
