import random

def miller_rabin(n):
  print(".")
  
def test():
  assert miller_rabin(2) == True
  assert miller_rabin(4) == False
  assert miller_rabin(17) == True
  assert miller_rabin(18) == False
  print("Passed")

test()
