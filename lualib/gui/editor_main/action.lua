local luaGui = {}
luaGui.main = require(ritnmods.gedit.defines.lib.gui.main.GuiElements)


local function close(LuaPlayer)
    luaGui.main.close(LuaPlayer)
end

local function none(LuaPlayer)
    return
end

















--------------------
local action = {}
action[ritnmods.gedit.defines.gui.editor_main.buttonClose.name] = close
action[ritnmods.gedit.defines.gui.editor_main.buttonBackSource.name] = none
action[ritnmods.gedit.defines.gui.editor_main.buttonSupprSource.name] = none
action[ritnmods.gedit.defines.gui.editor_main.buttonParamSource.name] = none
action[ritnmods.gedit.defines.gui.editor_main.buttonValidSource.name] = none
action[ritnmods.gedit.defines.gui.editor_main.buttonAddElement.name] = none

action[ritnmods.gedit.defines.gui.editor_main.elementFrame.name] = none
action[ritnmods.gedit.defines.gui.editor_main.elementFlow.name] = none
action[ritnmods.gedit.defines.gui.editor_main.elementSprite.name] = none
action[ritnmods.gedit.defines.gui.editor_main.elementSpriteButton.name] = none
action[ritnmods.gedit.defines.gui.editor_main.elementLabel.name] = none
action[ritnmods.gedit.defines.gui.editor_main.elementTextfield.name] = none
action[ritnmods.gedit.defines.gui.editor_main.elementButton.name] = none
action[ritnmods.gedit.defines.gui.editor_main.elementCheckbox.name] = none
action[ritnmods.gedit.defines.gui.editor_main.elementDropDown.name] = none
action[ritnmods.gedit.defines.gui.editor_main.elementEmpty.name] = none
action[ritnmods.gedit.defines.gui.editor_main.elementLine.name] = none
action[ritnmods.gedit.defines.gui.editor_main.elementListbox.name] = none
action[ritnmods.gedit.defines.gui.editor_main.elementProgressBar.name] = none
action[ritnmods.gedit.defines.gui.editor_main.elementRadio.name] = none
action[ritnmods.gedit.defines.gui.editor_main.elementScroll.name] = none
action[ritnmods.gedit.defines.gui.editor_main.elementSlider.name] = none
action[ritnmods.gedit.defines.gui.editor_main.elementTab.name] = none
action[ritnmods.gedit.defines.gui.editor_main.elementTabbedPane.name] = none
action[ritnmods.gedit.defines.gui.editor_main.elementTable.name] = none
action[ritnmods.gedit.defines.gui.editor_main.elementTextbox.name] = none

--------------------
return action