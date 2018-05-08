shared.import!

class Move

  new: (slot, direction) =>
    @slot = slot
    @direction = direction

    @board = slot.board

  checkMove: =>
    @hopOver = @board\getSlotAt @slot.position + @direction
    @destination = @board\getSlotAt @slot.position + @direction * 2
    true if @hopOver and @destination and @hopOver.token and not @destination.token

  apply: =>
    if @hopOver and @destination and @slot
      @slot.removeToken
      @hopOver.removeToken
      @destination.generateToken
