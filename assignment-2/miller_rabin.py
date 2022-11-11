import random

def miller_rabin(n, times):
  if n == 2:
    return "inconclusive"

  if n % 2 == 0:
    return "composite"

  q = n - 1
  k = 0

  # find integers k, q so that n - 1 = 2 ** k * q
  while q % 2 == 0:
    q //= 2
    k += 1

  # Try to falsify n's primality r times
  for _ in range(times):
    a = random.randrange(2, n - 1)

    if a ** q % n == 1:
      return "inconclusive"

    for j in range(k - 1):
      if a ** (2 ** j * q) % n == n - 1:
        return "inconclusive"

  return "composite"
  
def test():
  assert miller_rabin(2, 100) == "inconclusive"
  assert miller_rabin(4, 100) == "composite"
  assert miller_rabin(17, 100) == "inconclusive"
  assert miller_rabin(18, 100) == "composite"
  assert miller_rabin(163, 100) == "inconclusive"
  assert miller_rabin(173, 100) == "inconclusive"
  print("Passed")

test()
