import get_tickers
import get_data_ticker
import data_processing

def exec():
    print("Buscando lista de Tickers...")
    tickers = get_tickers.list()
    print("Encontrados:", tickers)
    for ticker in tickers:
        print(type(ticker),"\n",ticker)
        print(f"Consultando {ticker['ticker']}...")
        result = get_data_ticker.price(ticker['ticker'])
        data_processing.process(ticker=ticker, data=result)

