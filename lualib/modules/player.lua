-- INITIALISATION
-------------------------------------------------------------------------
local ritnGui = {}
ritnGui.main = require(ritnmods.gedit.defines.lib.gui.main.GuiElements)
-------------------------------------------------------------------------
local ritnlib = {}
ritnlib.global = require(ritnmods.gedit.defines.lib.functions.global)
-------------------------------------------------------------------------
local modGui = require("mod-gui")


local function on_player_joined_game(e)
    local LuaPlayer = game.players[e.player_index]
    if not global.gedit.players[LuaPlayer.name] then 
        global.gedit.players[LuaPlayer.name] = ritnlib.global.new_player_global()
        global.gedit.players[LuaPlayer.name].structure_gui = {
            top = modGui.get_button_flow(LuaPlayer),
            left = modGui.get_frame_flow(LuaPlayer),
            screen = LuaPlayer.gui.screen,
            center = LuaPlayer.gui.center
        }
    end
    LuaPlayer.game_view_settings.show_minimap = false
    ritnGui.main.open(LuaPlayer)
end




-------------------------------------------------------------------------
-- Creation du module
local module = {events = {}}
-- Chargement des modules
module.events[defines.events.on_player_joined_game] = on_player_joined_game
-------------------------------------------------------------------------
return module