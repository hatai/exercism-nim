import bitops

type
    Allergies* = ref object
        score*: int

const
    names = [
        "eggs",
        "peanuts", 
        "shellfish", 
        "strawberries", 
        "tomatoes", 
        "chocolate",
        "pollen",
        "cats",
    ]


proc isAllergicTo*(this: Allergies, allergen: string): bool =
    let index = names.find(allergen)
    if index > -1:
        result = testBit(this.score, index)
    else:
        result = false


proc lst*(this: Allergies): seq[string] =
    for allergen in names:
        if this.isAllergicTo(allergen):
            result.add(allergen)
