shared.import!
export Slot

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
    for row in *@slots
      for slot in *row
        if #slot\getValidMoves! > 0
          slot.token\select!

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
