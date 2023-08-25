import requests
import json
import constants

def process(ticker, data):
    write(ticker, data)
    notificate(ticker=ticker, data=data)

def write(ticker, data):
    print("Gravando dados...")
    url = f"{constants.firebase_url}prices/{ticker['ticker']}.json"
    print(url)
    res = requests.put(url=url,data=data)
    print(res.status_code,"\n",res.content)
    if res.status_code == 200:
        print("Sucesso")

def notificate(ticker, data):
    # print(data)
    print(f"Notificando se preço menor que {ticker['ceiling_price']}:", ticker['ceiling_price'])