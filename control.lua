-- Initialisation des variables globals
require("core.global")
-- Activation de gvv s'il est présent
if script.active_mods["gvv"] then require(ritnlib.defines.gvv)() end
-- Chargement de l'event listener :
local event_listener = require(ritnlib.defines.event)
-- envoie des modules à l'event listener :
event_listener.add_libraries(require(ritnmods.gedit.defines.modules.core))
