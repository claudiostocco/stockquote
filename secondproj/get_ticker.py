import yfinance as yf
from datetime import datetime

ticker = yf.Ticker(['MGLU3.SA','CPFE3.SA','BBAS3.SA'])
# print(ticker.get_actions())
# print(ticker.info)
data_ticker = ticker.history()

# end_data = datetime.now().strftime('%Y-%m-%d')
# data_ticker = yf.download("VALE", start="2023-08-01", end=end_data, progress=False)
print(data_ticker)