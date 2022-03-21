import sequtils

proc distance*(a: string, b: string) : int =
    if a.len != b.len:
        raise newException(ValueError, "input string a and b should be equal length")

    var x = 0
    for i in 0..<a.len:
        if a[i] != b[i]:
            inc(x)

    return x