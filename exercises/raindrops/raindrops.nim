import strformat

func pling(n: int): string =
    case n.mod(3)
    of 0: "Pling"
    else: ""

func plang(s: string, n: int): string =
    case n.mod(5)
    of 0: fmt"{s}Plang"
    else: s

func plong(s: string, n: int): string =
    if n.mod(7) == 0:
        return fmt"{s}Plong"
    if s == "": fmt"{n}"
    else: s

proc convert*(n: int): string =
    return n.pling.plang(n).plong(n)
    