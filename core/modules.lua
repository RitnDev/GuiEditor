local modules = {}
-----------------------
modules.events = require(ritnmods.gedit.defines.modules.events)
modules.player = require(ritnmods.gedit.defines.modules.player)

-- gui
modules.gui_editor_main = require(ritnmods.gedit.defines.modules.gui.editor_main)
modules.gui_properties = require(ritnmods.gedit.defines.modules.gui.properties)

-----------------------
return modules