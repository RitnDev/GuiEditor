-- INITIALISATION
local ritnGui = {}
ritnGui.prop = require(ritnmods.gedit.defines.lib.gui.prop.GuiElements)
ritnGui.prop.action = require(ritnmods.gedit.defines.lib.gui.prop.action)


local function on_gui_click(e)
    local element = e.element
    local LuaPlayer = game.players[e.player_index]
    local screen = LuaPlayer.gui.screen
    local LuaGuiEditor = screen[ritnmods.gedit.defines.gui.editor_prop.frame.name]
    local pattern = "([^-]*)-?([^-]*)-?([^-]*)"
    local LuaGui_name = ""
    local click = {
      ui, element, name, action
    }
  
    -- Action de la frame : Gui Editor
    if LuaGuiEditor == nil then return end
    
    LuaGui_name = ritnmods.gedit.defines.gui.editor_prop.frame.name
    if LuaGuiEditor.name ~= LuaGui_name then return end
    if element == nil then return end
    if element.valid == false then return end
    -- récupération des informations lors du clique
    click.ui, click.element, click.name = string.match(element.name, pattern)
    click.action = click.element .. "-" .. click.name

    -- Actions
    if click.ui == "gedit" then
        if click.element ~= "button" then return end
        if not ritnGui.prop.action[element.name] then return end
        ritnGui.prop.action[element.name](LuaPlayer)
        return
    end


end




-- Creation du module
local module = {}
module.events = {}

-- Chargement des modules
--module.events[defines.events.on_gui_click] = on_gui_click
--module.events[defines.events.on_gui_selection_state_changed] = on_gui_selection_state_changed

return module