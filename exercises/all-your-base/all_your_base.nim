import algorithm, math

proc convert*(inputDigits: openarray[int], inputBase, outputBase: int): seq[int] =
    if inputBase < 2 or outputBase < 2:
        raise newException(ValueError, "inputBase and putputBase must be bigger than 2.")
    
    let reversedInputDigits = reversed(inputDigits)
    var outputDigits: seq[int]

    var base10 = 0
    for i in 0..<inputDigits.len:
        let digit = reversedInputDigits[i]
        if digit < 0 or digit >= inputBase:
            raise newException(ValueError, "element of inputDigits must be '0 <= e < inputBase'")

        base10 += digit*inputBase^i

    while base10 != 0:
        outputDigits.add(base10.mod(outputBase))
        base10 = (base10 / outputBase).floor.toInt

    if outputDigits.len == 0:
        outputDigits.add(0)

    return outputDigits.reversed