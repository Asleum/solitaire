shared.import!
export Storage

class Slot

  new: (board, position) =>
    @board = board
    @position = position
    @worldPosition = board\mapSlot @
    @object = Storage\loadSlot!
    @object.Name = string.format "Slot%i;%i", position.x, position.y
    @object.CFrame = CFrame.new @worldPosition
    @object.Parent = workspace
