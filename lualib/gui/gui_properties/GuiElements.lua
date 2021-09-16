---------------------------------------------------------------------------------------------
local flib = {}
flib.gui =         require(ritnlib.defines.gui)
flib.styles =      require(ritnlib.defines.styles)
--flib.global =      require(ritnmods.gedit.defines.lib.functions.global)
---------------------------------------------------------------------------------------------

-- Properties
local visible = false
local modGui = require("mod-gui")



local function create(LuaPlayer)
    local screen = LuaPlayer.gui.screen
    local content = {}

    
end




-- close gui
local function close(LuaPlayer)
    local screen = LuaPlayer.gui.screen
    local frame = screen[ritnmods.gedit.defines.gui.editor_prop.frame.name]
  
    if frame then 
        global.gedit.players[LuaPlayer.name].prop.last_x = frame.location.x
        global.gedit.players[LuaPlayer.name].prop.last_y = frame.location.y
        frame.destroy()
    end
end

-- open gui
local function open(LuaPlayer)
    close(LuaPlayer)
    create(LuaPlayer)
end


-----------------------------------
local luaGui = {}

luaGui.open = open
luaGui.close = close

return luaGui