proc onSquare*(n: int): uint64 =
    if n < 1 or n > 64:
        raise newException(ValueError, "Invalid argument")

    1'u64 shl (n - 1)


proc total*(): uint64 = 
    for i in 1..64: 
        result += onSquare(i)