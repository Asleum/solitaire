shared.import!
export Move, Storage, Token

class Slot

  new: (board, position) =>
    @board = board
    @position = position

    @worldPosition = board\mapSlot @
    @generateToken!

    @object = Storage\loadSlot!
    @object.Name = string.format "Slot%i;%i", position.x, position.y
    @object.CFrame = CFrame.new @worldPosition
    @object.Parent = workspace

  generateToken: =>
    if not @token
      @token = Token @

  removeToken: =>
    if @token
      @token\delete!
      @token = nil

  getValidMoves: =>
    if @token
      moves = [Move @, direction for direction in *@board.moveDirections]
      return [move for move in *moves when move\checkMove!]
    else
      {}
