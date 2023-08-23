import scheduler as sc

def startServer():
  print('Starting server...')
  sc.start()
  print('Server started','\n')

  while not sc.finished:
    print('exit -> Stop server')
    print('')
    key = input('Type command: ')
    sc.finished = key.__eq__('exit')

startServer()