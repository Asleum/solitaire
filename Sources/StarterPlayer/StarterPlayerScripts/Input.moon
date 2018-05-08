shared.import!

class Input

  @mouse: (game\GetService "Players").LocalPlayer\GetMouse!

  @waitForInput: (candidates) =>
    @@mouse.Button1Down\Wait!
    if candidates[@mouse.Target]
      candidates[@mouse.Target]
    else
      @@waitForInput candidates
