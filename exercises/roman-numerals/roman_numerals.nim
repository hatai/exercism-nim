proc toRomanOneBase(num: int): string =
    case num
    of 1: return "I"
    of 2: return "II"
    of 3: return "III"
    of 4: return "IV"
    of 5: return "V"
    of 6: return "VI"
    of 7: return "VII"
    of 8: return "VIII"
    of 9: return "IX"
    else: return ""

proc toRomanTenBase(num: int): string =
    case num
    of 1: return "X"
    of 2: return "XX"
    of 3: return "XXX"
    of 4: return "XL"
    of 5: return "L"
    of 6: return "LX"
    of 7: return "LXX"
    of 8: return "LXXX"
    of 9: return "XC"
    else: return ""

proc toRomanHandredBase(num: int): string =
    case num
    of 1: return "C"
    of 2: return "CC"
    of 3: return "CCC"
    of 4: return "CD"
    of 5: return "D"
    of 6: return "DC"
    of 7: return "DCC"
    of 8: return "DCCC"
    of 9: return "CM"
    else: return ""

proc toRomanThousandBase(num: int): string =
    case num
    of 1: return "M"
    of 2: return "MM"
    of 3: return "MMM"
    of 4: return ""
    of 5: return ""
    of 6: return ""
    of 7: return ""
    of 8: return ""
    of 9: return ""
    else: return ""

proc roman*(num : int) : string =
    let thousand = int(num / 1000)
    let hundred = int(num.mod(1000) / 100)
    let ten = int(num.mod(100) / 10)
    let one = int(num.mod(10))

    var output : string
    output &= toRomanThousandBase(thousand)
    output &= toRomanHandredBase(hundred)
    output &= toRomanTenBase(ten)
    output &= toRomanOneBase(one)
    return output
