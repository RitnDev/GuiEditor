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

        local table_children = flib.global.list_children(LuaPlayer)

        if table_children[1] == nil then
            table.remove(table_name)
            LuaPlayer.print({"msg.action-select_children"},{r=1,g=0,b=0,a=1})
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
        local children_name = table_name[#table_name]
        local index_origine = player_main.source_index
        local index_precedent = index_origine - 1

        if index_precedent == 0 then return end

        player_main.source_index = index_precedent
        player_main.source_show = LuaGuiElement.get_item(index_precedent)
        table.remove(table_name)
        
        local table_children = flib.global.list_children(LuaPlayer)
        player_main.children_selected = children_name
        for i = 1, #table_children do 
            if table_children[i] == player_main.children_selected then 
                player_main.children_selected_index = i
            end
        end
        player_main.children_selected_type = flib.global.get_type_children(LuaPlayer)
        
        --update de la fenetre
        luaGui.main.open(LuaPlayer)

    end
end



-- supprimer un enfant (et tout ce qu'il contient)
local function suppr_source(LuaPlayer)
    local screen = LuaPlayer.gui.screen
    local frame = screen[ritnmods.gedit.defines.gui.editor_main.frame.name]

    if frame then
        local children = flib.global.get_children(LuaPlayer)

        if children and children.default == false then
            local children_name = children.guiElement.name
            flib.global.set_children(LuaPlayer, nil) 
            back_source(LuaPlayer)
            local children = flib.global.get_children(LuaPlayer)

            children.guiElement[children_name].destroy()
            LuaPlayer.print({"msg.action-yes_suppr_children"},{r=0,g=1,b=0,a=1})
        else
            LuaPlayer.print({"msg.action-no_suppr_children"},{r=1,g=0,b=0,a=1})
        end
    end
end



-- Action : Ouvrir la fenêtre de propriété de l'objet selectionné
local function open_proprietes(LuaPlayer)
    local screen = LuaPlayer.gui.screen
    local frame = screen[ritnmods.gedit.defines.gui.editor_prop.frame.name]
    local children = flib.global.get_children(LuaPlayer)

    if not frame then 
        if children.type == nil then return end
        if children.default == true then return end
        luaGui.prop.open(LuaPlayer, children)
    end
end

------------------------------------  ADD ELEMENT  ------------------------------------------


-- Frame
local function create_element_frame(LuaPlayer)


    local children = flib.global.get_children(LuaPlayer)

    if children then 
        
        local ui_name = global.gedit.players[LuaPlayer.name].parametres.ui_name
        local sep = global.gedit.players[LuaPlayer.name].parametres.separateur
        local i = 1
        local ok = true
        local new_name = ""

        while ok do 
            new_name = "frame" .. i
            if children.children[new_name] then 
                i = i + 1
            else
                ok = false
            end
        end

        local new_children = {
            name = new_name,
            index = children.index + 1,
            type = "frame",
            parent = children.name,
            children = {},
            style = {},
            default = false
        }

        new_children.guiElement = ritnlib.gui.createFrame(
            children.guiElement,
            ui_name .. sep .. new_children.type .. sep .. new_children.name,
            new_children.name
        )
        new_children.style.width = 100
        new_children.style.height = 100
        new_children.guiElement.style.width = new_children.style.width
        new_children.guiElement.style.height = new_children.style.height

        children.children[new_children.name] = new_children
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
action[ritnmods.gedit.defines.gui.editor_main.buttonSupprSource.name] = suppr_source
action[ritnmods.gedit.defines.gui.editor_main.buttonParamSource.name] = open_proprietes
action[ritnmods.gedit.defines.gui.editor_main.buttonValidSource.name] = select_children

action[ritnmods.gedit.defines.gui.editor_main.elementFrame.name] = create_element_frame
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