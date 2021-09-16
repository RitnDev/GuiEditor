local luaGui = {}
luaGui.main = require(ritnmods.gedit.defines.lib.gui.main.GuiElements)
luaGui.prop = require(ritnmods.gedit.defines.lib.gui.prop.GuiElements)
---------------------------------------------------------------------------------------------
local flib = {}
flib.gui = require(ritnmods.gedit.defines.lib.functions.gui)
flib.global = require(ritnmods.gedit.defines.lib.functions.global)
---------------------------------------------------------------------------------------------

-- SANS EFFET POUR LE MOMENT
local function none(LuaPlayer)
    return
end

------------------------------------  LIST / DROP  ------------------------------------------

-- Changement de la drop-down (source)
local function change_dropSource(LuaPlayer)
    local screen = LuaPlayer.gui.screen
    local frame = screen[ritnmods.gedit.defines.gui.editor_main.frame.name]

    if frame then
        local LuaGuiElement = flib.gui.get_elementGUI_main(frame, "dropSource")
        local player_main = global.gedit.players[LuaPlayer.name].main
        local table_name = global.gedit.players[LuaPlayer.name].table_name

        player_main.source_index = LuaGuiElement.selected_index
        player_main.source_show = LuaGuiElement.get_item(LuaGuiElement.selected_index)

        for i = #table_name, player_main.source_index, -1 do 
            if player_main.source_index < #table_name then
                table.remove(table_name)
            end
        end

        --update de la fenetre
        luaGui.main.open(LuaPlayer)
    end
end


-- Changement de la listbox (children)
local function change_listChildren(LuaPlayer)
    local screen = LuaPlayer.gui.screen
    local frame = screen[ritnmods.gedit.defines.gui.editor_main.frame.name]

    if frame then
        local LuaGuiElement = flib.gui.get_elementGUI_main(frame, "listChildren")

        global.gedit.players[LuaPlayer.name].main.children_selected_index = LuaGuiElement.selected_index
        local children_name = LuaGuiElement.get_item(LuaGuiElement.selected_index)
        local table_name = global.gedit.players[LuaPlayer.name].table_name

        global.gedit.players[LuaPlayer.name].main.children_selected = children_name
        global.gedit.players[LuaPlayer.name].main.children_selected_type = flib.global.get_type_children(LuaPlayer) 

        --update de la fenetre
        luaGui.main.open(LuaPlayer)
    end
end

------------------------------------  BUTTONS  ------------------------------------------

-- Action : Fermer la frame -> Gui_Editor
local function close(LuaPlayer)
    luaGui.main.close(LuaPlayer)
    luaGui.prop.close(LuaPlayer)
end

-- Action : Selection de l'enfant -> listChildren valider
local function select_children(LuaPlayer)
    local screen = LuaPlayer.gui.screen
    local frame = screen[ritnmods.gedit.defines.gui.editor_main.frame.name]

    if frame then
        local player_main = global.gedit.players[LuaPlayer.name].main
        local table_name = global.gedit.players[LuaPlayer.name].table_name
        --Ajout de l'element selectionné dans table_name
        table.insert(table_name,player_main.children_selected)

        local table_children = flib.global.get_children(LuaPlayer)

        if table_children[1] == nil then
            table.remove(table_name)
            LuaPlayer.print({"msg.action-select_children"})
            return
        else
            player_main.source_show = player_main.children_selected
            player_main.source_index = player_main.source_index + 1
            player_main.children_selected = table_children[1]
            player_main.children_selected_index = 1
            player_main.children_selected_type = flib.global.get_type_children(LuaPlayer) 
        end


        --update de la fenetre
        luaGui.main.open(LuaPlayer)
    end
end

local function back_source(LuaPlayer)
    local screen = LuaPlayer.gui.screen
    local frame = screen[ritnmods.gedit.defines.gui.editor_main.frame.name]

    if frame then
        local LuaGuiElement = flib.gui.get_elementGUI_main(frame, "dropSource")
        local player_main = global.gedit.players[LuaPlayer.name].main
        local table_name = global.gedit.players[LuaPlayer.name].table_name
        local index_origine = player_main.source_index
        local index_precedent = index_origine - 1

        if index_precedent == 0 then return end

        player_main.source_index = index_precedent
        player_main.source_show = LuaGuiElement.get_item(index_precedent)
        table.remove(table_name)

        local table_children = flib.global.get_children(LuaPlayer)
        player_main.children_selected = table_children[1]
        player_main.children_selected_index = 1
        player_main.children_selected_type = flib.global.get_type_children(LuaPlayer)

        --update de la fenetre
        luaGui.main.open(LuaPlayer)
    end
end

-- Action : Ouvrir la fenêtre de propriété de l'objet selectionné
local function open_proprietes(LuaPlayer)
    local screen = LuaPlayer.gui.screen
    local frame = screen[ritnmods.gedit.defines.gui.editor_prop.frame.name]

    if frame then 
        luaGui.prop.close(LuaPlayer)
    else 
        luaGui.prop.open(LuaPlayer)
    end
end





--------------------
local action = {}

--drop / list
action[ritnmods.gedit.defines.gui.editor_main.dropSource.name] = change_dropSource
action[ritnmods.gedit.defines.gui.editor_main.listChildren.name] = change_listChildren

--button
action[ritnmods.gedit.defines.gui.editor_main.buttonClose.name] = close
action[ritnmods.gedit.defines.gui.editor_main.buttonBackSource.name] = back_source
action[ritnmods.gedit.defines.gui.editor_main.buttonSupprSource.name] = none
action[ritnmods.gedit.defines.gui.editor_main.buttonParamSource.name] = open_proprietes
action[ritnmods.gedit.defines.gui.editor_main.buttonValidSource.name] = select_children
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