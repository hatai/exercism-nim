import math, strutils

const
    BOARD_SIZE = 8

type
    Queen* = object
        row*: int
        col*: int

proc `==`[Queen](w, b: openArray[Queen]): bool =
    return w.row == b.row and w.col == b.col
    
proc valid(w: Queen): bool =
    if w.row notin 0..<BOARD_SIZE or w.col notin 0..<BOARD_SIZE:
        return false

    return true

proc initQueen*(r: int, c: int): Queen =
    let queen: Queen = Queen(row: r, col: c)
    if queen.valid:
        return queen
    else:
        raise newException(ValueError, "Cannot have the invalid positon.")

proc canAttack*(w : Queen, b: Queen): bool =
    if not w.valid or not b.valid or w == b:
        raise newException(ValueError, "Cannot have the invalid position.")
        
    if w.row == b.row or w.col == b.col:
        return true

    if (w.row - b.row)^2 - (w.col - b.col)^2 == 0:
        return true
    
    return false

proc board*(w: Queen, b: Queen): string =
    if not w.valid or not b.valid or w == b:
        raise newException(ValueError, "Cannot have the inalid position.")

    result = ("_".repeat(BOARD_SIZE) & '\n').repeat(BOARD_SIZE)
    result[BOARD_SIZE * w.row + w.row + w.col] = 'W'
    result[BOARD_SIZE * b.row + b.row + b.col] = 'B'