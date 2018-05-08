export Board

print "Initializing game"

-- Where to look for modules
SOURCES = (game\GetService "StarterPlayer")\WaitForChild "StarterPlayerScripts"

-- Table containing all variable environments. It is initialized with this script's environment,
-- so we can call loaded modules from here later on.
environments = {getfenv!}
modules = {}

-- Import shared function : should be called at the beginning of each module.
shared.import = -> table.insert environments, (getfenv 2)

-- Recursively loads this element's children
findModules = (source) ->
  for element in *source\GetChildren!
    if element.ClassName == "ModuleScript"
      require element -- Runs the module, so we won't have to do it again later
      table.insert modules, element -- Reference to the module is stored
    elseif element.ClassName == "Folder"
      findModules element

findModules SOURCES

-- Add all the loaded modules to all the variable environments
for environment in *environments
    environment[module.Name] = require module for module in *modules

-- Initialize the game
Board!
true
