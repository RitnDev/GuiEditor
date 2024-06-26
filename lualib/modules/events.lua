local events = {}
--------------------------------------------------------------------------
local luaGui = {}
luaGui.main = require(ritnmods.gedit.defines.lib.gui.main.GuiElements)


local function call_remote_functions()
    pcall(function() remote.call("freeplay", "set_skip_intro", true) end) 
    pcall(function() remote.call("freeplay", "set_disable_crashsite", true) end) 
end
  
function events.on_init(event)
    -- Call remote functions.
    call_remote_functions()
end
  
function events.on_load(event)
    -- Call remote functions.
    call_remote_functions()
end



local function no_multiplayer(e)
    if e.tick >=0 then
        if game.is_multiplayer == true then
            error("Ce mod ne peut-être activé en partie multijoueur !")
        end
    end
end


local function open_close_menu(e)
    local LuaPlayer = game.players[e.player_index]
    local screen = LuaPlayer.gui.screen
    local frame = screen[ritnmods.gedit.defines.gui.editor_main.frame.name]
  
    if frame then 
        luaGui.main.close(LuaPlayer)
    else
        luaGui.main.open(LuaPlayer)
    end
end


-------------------------------------------
-- event : on_tick
script.on_event({defines.events.on_tick},function(e)
    no_multiplayer(e)
end)

-- event : custom-input -> toggle_main_menu
script.on_event(ritnmods.gedit.defines.customInput.toggle_main_menu,function(e)
    open_close_menu(e)
end)

-------------------------------------------
return events