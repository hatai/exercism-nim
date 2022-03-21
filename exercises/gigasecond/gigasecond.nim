import times

const
    gigaseconds = int64(1e9)
    dur = initDuration(seconds = gigaseconds)

proc addGigasecond*(moment : DateTime) : DateTime = 
    return moment + dur