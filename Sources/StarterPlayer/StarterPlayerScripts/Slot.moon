shared.import!
export Storage, Token

class Slot

  new: (board, position) =>
    @board = board
    @position = position
    @worldPosition = board\mapSlot @
    @token = Token @

    @object = Storage\loadSlot!
    @object.Name = string.format "Slot%i;%i", position.x, position.y
    @object.CFrame = CFrame.new @worldPosition
    @object.Parent = workspace

  removeToken: =>
    if @token
      @token\delete!
      @token = nil
