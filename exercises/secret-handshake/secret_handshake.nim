import math, algorithm

proc handshake(input: var seq[string], n: int) =
    case n
    of 1 shl 0: input.add("wink")
    of 1 shl 1: input.add("double blink")
    of 1 shl 2: input.add("close your eyes")
    of 1 shl 3: input.add("jump")
    of 1 shl 4: input.reverse
    else: return

proc commands*(n : int): seq[string] =
    result = newSeq[string]()
    var bit = 1
    for i in 1..5:
        result.handshake(n and bit)
        bit = bit shl 1
