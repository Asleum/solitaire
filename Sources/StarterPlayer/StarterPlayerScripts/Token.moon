shared.import!
export Slot, Storage

class Token

  new: (slot) =>
    @slot = slot

    @object = Storage\loadToken!
    @object\SetPrimaryPartCFrame slot.worldPosition
    @object\WaitForChild("AlignPosition").Attachment1 = slot.object.PrimaryPart.Attachment
    @object\WaitForChild("AlignOrientation").Attachment1 = slot.object.PrimaryPart.Attachment
    @object.Parent = workspace
    @object\MakeJoints!

  delete: =>
     if @object
       @object\Destroy!

  blowUp: =>
    if @object
      @object.AlignPosition.Enabled = false
      @object.AlignOrientation.Enabled = false
      @object\BreakJoints!
      spawn ->
        wait 3
        @object\Destroy!

  select: =>
    if @object
      for part in *@object\GetChildren!
        part.Material = "Neon" if part\IsA "BasePart"

  deselect: =>
    if @object
      for part in *@object\GetChildren!
        part.Material = "Plastic" if part\IsA "BasePart"
