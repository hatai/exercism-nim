from std/math import sum
from std/sequtils import deduplicate

func sum*(limit: int, factors: seq[int]): int =
    if factors.len < 1 or limit < factors.min:
        return 0

    var multiples = newSeq[int]()
    for factor in factors:
        if factor == 0:
            break

        var i = 1
        while true:
            let e = factor * i
            if e < limit:
                multiples.add(e)
                i += 1
            else: 
                break

    result = multiples.deduplicate.sum
