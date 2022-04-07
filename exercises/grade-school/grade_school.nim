from std/sequtils import mapIt, filterIt
from std/algorithm import sortedByIt

type
    Student* = tuple
        name: string
        grade: int

    School* = ref object
        students*: seq[Student]


func roster*(this: School): seq[string] =
    result = this.students
                .sortedByIt((it.grade, it.name))
                .mapIt(it.name)

func grade*(this: School, n: int): seq[string] =
    result = this.students
                .filterIt(it.grade == n)
                .mapIt(it.name)
                .sortedByIt(it)