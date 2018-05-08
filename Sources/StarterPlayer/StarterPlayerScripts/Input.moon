shared.import!

class Input

  @mouse: (game\GetService "Players").LocalPlayer\GetMouse!

  @waitForInput: (candidates) =>
    @@mouse.Button1Down\Wait!
    if @mouse.Target and candidates[@mouse.Target.Parent]
      candidates[@mouse.Target.Parent]
    else
      @@waitForInput candidates
