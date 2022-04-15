import math, strutils

func isArmstrongNumber*(input: int): bool =
    var v: int = 0
    for c in $input:
        v +=  parseInt($c) ^ ($input).len

    input == v

