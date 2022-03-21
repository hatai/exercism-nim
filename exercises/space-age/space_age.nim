const
    Earth = "Earth"
    Mercury = "Mercury"
    Venus = "Venus"
    Mars = "Mars"
    Jupiter = "Jupiter"
    Saturn = "Saturn"
    Uranus = "Uranus"
    Neptune = "Neptune"
    earthSeconds = 31557600

func `/`(x, y : int64): float =
    return int(x) / int(y)

proc age*(name: string, seconds: int64): float =
    case name
    of Earth: return seconds / earthSeconds
    of Mercury: return seconds / earthSeconds / 0.2408467
    of Venus: return seconds / earthSeconds / 0.61519726
    of Mars: return seconds / earthSeconds / 1.8808158
    of Jupiter: return seconds / earthSeconds / 11.862615
    of Saturn: return seconds / earthSeconds / 29.447498
    of Uranus: return seconds / earthSeconds / 84.016846
    of Neptune: return seconds / earthSeconds / 164.79132
    else: return 0.0
