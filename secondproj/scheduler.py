import sched
from datetime import datetime

scheduler = sched.scheduler()
finished = False

def test():
  print(f"{datetime.now().ctime()} -> Testando scheduler!")
  if not finished:
    addTask()

def addTask():
  scheduler.enter(delay=2, priority=0, action=test)

def start():
  addTask()
  scheduler.run(blocking=False)

