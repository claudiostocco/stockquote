import get_tickers

def exec():
    print("Buscando lista de Tickers...")
    tickers = get_tickers.list()
    print("Encontrados:", tickers)
    for ticker in tickers:
        print(type(ticker),"\n",ticker)
        print(f"Consultando {ticker['ticker']}...")
