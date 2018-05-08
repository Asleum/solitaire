shared.import!
export Slot, Storage

class Token

  new: (slot) =>
    @slot = slot

    @object = Storage\loadToken!
    @object.CFrame = CFrame.new slot.worldPosition
    @object.Parent = workspace

  delete: =>
    if @object
      @object\Destroy!
