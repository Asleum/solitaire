shared.import!
export Move, Storage, Token

class Slot

  new: (board, position) =>
    @board = board
    @position = position

    rotation = CFrame.Angles math.pi * math.random!, math.pi * 2 * math.random!, 0
    @worldPosition = CFrame.new(board\mapSlot @) * rotation
    @object = Storage\loadSlot!
    @object.Name = string.format "Slot%i;%i", position.x, position.y
    @object\SetPrimaryPartCFrame @worldPosition
    @object.Parent = workspace
    @generateToken!

  generateToken: =>
    if not @token
      @token = Token @

  removeToken: =>
    if @token
      @token\delete!
      @token = nil

  captureToken: (slot) =>
    token = slot.token
    slot.token = nil
    @token = token
    token.object.AlignPosition.Attachment1 = @object.PrimaryPart.Attachment
    token.object.AlignOrientation.Attachment1 = @object.PrimaryPart.Attachment

  blowUpToken: =>
    if @token
      @token\blowUp!
      @token = nil

  getValidMoves: =>
    if @token
      moves = [Move @, direction for direction in *@board.moveDirections]
      return [move for move in *moves when move\checkMove!]
    else
      {}

  select: =>
    if @object
      for part in *@object\GetChildren!
        part.Material = "Neon" if part\IsA "BasePart"

  deselect: =>
    if @object
      for part in *@object\GetChildren!
        part.Material = "Plastic" if part\IsA "BasePart"
