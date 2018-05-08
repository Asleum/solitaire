shared.import!
export Slot

class Board

  new: =>
    @initializeSlots!

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
