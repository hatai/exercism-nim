func steps*(n: int): int =
    if n <= 0:
        raise newException(ValueError, "must be positive number.")

    result = 0
    var m = n
    while m != 1:
        inc(result)

        if m mod 2 == 0:
            m = (int m / 2)
        else:
            m = (3 * m) + 1
