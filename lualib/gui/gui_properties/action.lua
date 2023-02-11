local luaGui = {}
luaGui.prop = require(ritnmods.gedit.defines.lib.gui.prop.GuiElements)
---------------------------------------------------------------------------------------------
local flib = {}
---------------------------------------------------------------------------------------------

-- SANS EFFET POUR LE MOMENT
local function none(LuaPlayer)
    return
end


------------------------------------  BUTTONS  ------------------------------------------

-- Action : Fermer la frame -> Gui_Prop
local function close(LuaPlayer)
    luaGui.prop.close(LuaPlayer)
end





--------------------
local action = {}

--button
action[ritnmods.gedit.defines.gui.editor_prop.PropButtonClose.name] = close
action[ritnmods.gedit.defines.gui.editor_prop.PropButtonValid.name] = none

--------------------
return action