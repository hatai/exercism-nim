import math

type
    Coord = tuple[x: float, y: float]

proc score*(c: Coord) : int =
    var distance = float64(c.x^2 + c.y^2).sqrt
    if distance <= 1:
        10
    elif distance > 1 and distance <= 5:
        5
    elif distance > 5 and distance <= 10:
        1
    else:
        0