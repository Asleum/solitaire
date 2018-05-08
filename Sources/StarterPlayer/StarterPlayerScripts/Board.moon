shared.import!
export Input, Slot

class Board

  new: =>
    @moveDirections = {
      Vector2.new 1, 0,
      Vector2.new -1, 0
      Vector2.new 0, 1
      Vector2.new 0, -1
      Vector2.new -1, -1
      Vector2.new 1, 1
    }
    @initializeSlots!
    @play!

  play: =>
    selectableSlots = {}
    for row in *@slots
      for slot in *row
        if #slot\getValidMoves! > 0
          slot.token\select!
          selectableSlots[slot.token.object] = slot
    chosen = Input\waitForInput selectableSlots
    slot.token\deselect! for _, slot in pairs selectableSlots

    selectableMoves = {}
    for move in *chosen\getValidMoves!
      move.destination\select!
      selectableMoves[move.destination.object] = move
    chosen = Input\waitForInput selectableMoves
    move.destination\deselect! for _, move in pairs selectableMoves
    chosen\apply!
    @play!


  initializeSlots: =>
    @slots = {}
    for y = 1, 5
      table.insert @slots, [Slot @, (Vector2.new x, y) for x = 1, y]
    @slots[3][2]\removeToken!

  mapSlot: (slot) =>
    scale = Vector3.new 8, 6, 0
    offset = Vector3.new -4, 18, 0
    return Vector3.new(
      -slot.position.y/2 + slot.position.x,
      -slot.position.y, 0) * scale + offset

  getSlotAt: (position) =>
    if position.y > 0 and position.y <= #@slots
      row = @slots[position.y]
      if position.x > 0 and position.x <= #row
        row[position.x]
