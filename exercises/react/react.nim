import sugar, sequtils

type
    Reactor* = ref object
        cells: seq[Cell]
    
    ComputeCellFunction = seq[int] -> int
    ComputeCellCallback = proc(x: int)

    CellKind = enum
        Input, Compute

    Cell* = ref object
        reactor: Reactor
        val: int
        case kind: CellKind
        of Input: discard
        of Compute:
            input: seq[Cell]
            function: ComputeCellFunction
            callbacks*: seq[ref ComputeCellCallback]

proc value*(cell: Cell): int =
    if cell.kind == Input:
        result = cell.val
        
    elif cell.kind == Compute:
        result = cell.function(cell.input.map(value))

proc update(reactor: Reactor) = 
    for cell in reactor.cells:
        if cell.val == cell.value:
            continue

        for callback in cell.callbacks:
            callback[](cell.value)

proc `value=`*(cell: Cell, value: int) =
    cell.val = value
    cell.reactor.update()

proc newReactor*(): Reactor = Reactor()

proc createInput*(reactor: Reactor, value: int): Cell =
    result = Cell(kind: Input, reactor: reactor, val: value)
    reactor.cells.add result

proc createCompute*(reactor: Reactor, input: seq[Cell], function: ComputeCellFunction): Cell =
    result = Cell(kind: Compute, reactor: reactor, input: input, function: function)
    result.val = result.value
    reactor.cells.add result

proc addCallback*(cell: Cell, callback: ComputeCellCallback): ref ComputeCellCallback = 
    var cb = new ComputeCellCallback
    cb[] = callback
    cell.callbacks.add cb
    result = cb

proc removeCallback*(cell: Cell, callback: ref ComputeCellCallback) =
    cell.callbacks.delete cell.callbacks.find(callback)