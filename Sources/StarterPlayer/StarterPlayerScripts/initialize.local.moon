export Board

print "Initializing game"

SOURCES = (game\GetService "StarterPlayer")\WaitForChild "StarterPlayerScripts"

environments = {getfenv!}
modules = {}

shared.import = -> table.insert(environments, getfenv 2)

findModules = (source) ->
  for element in *source\GetChildren!
    if element.ClassName == "ModuleScript"
      require element
      table.insert modules, element
    elseif element.ClassName == "Folder"
      findModules element

findModules SOURCES

for environment in *environments
    environment[module.Name] = require module for module in *modules

Board!
Board!
true
