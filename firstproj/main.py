from pandas_datareader import data as web
import pandas as pd
import matplotlib.pyplot as plt

# quote = web.DataReader('^BVSP', data_source='yahoo', start='08-11-2023', end='08-11-2023')
quote = web.YahooDailyReader('^BVSP', start='08-11-2023', end='08-11-2023')
print(quote.read())
