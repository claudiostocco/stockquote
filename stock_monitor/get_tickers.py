import requests
import json
import constants

def list():
    response = requests.get(constants.firebase_url + 'tickers.json')
    if response.status_code == 200:
        return json.loads(response.content)
    else:
        print('Error geting list tickers')