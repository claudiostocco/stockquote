import io
import sched
from datetime import datetime

scheduler = sched.scheduler()
finished = False

def test():
  s = f"{datetime.now().ctime()} -> Testando scheduler!"
  print(s)
  
  monfile = io.open(file='./monitor.txt',mode="+a")
  monfile.write(s+'\n')
  monfile.flush
  monfile.close

  if not finished:
    addTask()

def addTask():
  scheduler.enter(delay=2, priority=0, action=test)

def start():
  addTask()
  scheduler.run(blocking=True)

