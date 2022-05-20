import strformat


type
    Clock = tuple
        hours: int
        minutes: int


const
    MINUTES = 60
    HOURS = 24


func toStr*(self: Clock): string = 
    fmt"{self.hours:02}:{self.minutes:02}"


func create*(self: Clock): Clock = 
    var minutes = (self.hours * MINUTES) + self.minutes
    while minutes < 0:
        minutes = (HOURS * MINUTES) + minutes

    let hours = (int minutes / MINUTES) mod HOURS
    minutes = minutes mod MINUTES
    result = (hours , minutes)


func add*(self: Clock, n: int): Clock =
    create((self.hours, self.minutes + n))


func subtract*(self: Clock, n: int): Clock =
    create((self.hours, self.minutes - n))

