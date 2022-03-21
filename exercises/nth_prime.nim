import math

proc isPrime(x : int) : bool = 
    for i in 2..int(x/2):
        if (x.mod(i)) == 0:
            return false          

    return true

proc prime*(x: int): int =
    if x <= 0:
        raise newException(ValueError, "x should be bigger than 1")

    var primes: seq[int] = @[2]
    var y = 3

    while x != primes.len:
        if isPrime(y):
            primes.add(y)

        y += 2

    return primes[x - 1]
    