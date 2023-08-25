from datetime import datetime
import pandas_datareader as pdr
import yfinance as yf

def price1(ticker):
  seek_date = datetime.now().strftime('%Y-%m-%d')
  data_ticker = pdr.get_data_yahoo(ticker,seek_date,seek_date)
  print(data_ticker)

def price(ticker):
  tickerData = yf.Ticker(ticker=ticker)
  seek_date = datetime.now().strftime('%Y-%m-%d')
  # print(tickerData.get_actions())
  # print(tickerData.info)
  data_ticker = tickerData.history(period="1d",interval="1m")
  print(data_ticker)
  return data_ticker.to_json()

def down(ticker):
  end_data = datetime.now().strftime('%Y-%m-%d')
  data_ticker = yf.download("VALE", start="2023-08-01", end=end_data, progress=False)
  print(data_ticker)

# yf.pdr_override()
# price('sanb3.sa')