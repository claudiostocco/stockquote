import requests
import constants

def list():
    response = requests.get(constants.firebase_url + '')
    if response.status_code == 200:
        return response.content
    else:
        print('Error geting list tickers')