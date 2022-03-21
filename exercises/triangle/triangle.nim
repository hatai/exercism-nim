import math, sequtils, algorithm

type
    Triangle = array[0..2, int]


proc isValid(val: Triangle): bool =
    if val.anyIt(it <= 0):
        false
    else:
        let sorted_val = val.sorted(system.cmp[int])
        sorted_val[0] + sorted_val[1] > sorted_val[2]

proc isEquilateral*(val: Triangle): bool =
    result = false
    if val.isValid:
        result = val.allIt(it == val[0])

proc isIsosceles*(val: Triangle): bool =
    result = false
    if val.isValid:
        let sorted_val = val.sorted(system.cmp[int])
        result = sorted_val[0] == sorted_val[1] or sorted_val[1] == sorted_val[2]

proc isScalene*(val: Triangle): bool =
    result = false
    if val.isValid:
        result = not val.isIsosceles
