shared.import!

class Storage

  @replicated = game\GetService "ReplicatedStorage"

  @loadSlot: ->
    (@replicated\WaitForChild "Slot")\clone!

  @loadToken: ->
    (@replicated\WaitForChild "Token")\clone!
