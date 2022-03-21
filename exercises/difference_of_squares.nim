import math, sequtils 

proc squareOfSum*(x: int): int =
    toSeq(1..x).sum^2

proc sumOfSquares*(x: int): int =
    toSeq(1..x).mapIt(it^2).sum

proc difference*(x: int): int =
    squareOfSum(x) - sumOfSquares(x)
    