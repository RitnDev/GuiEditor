-- Fonctions "gui"


-- retourne un LuaGuiElement du GUI editor_main
local function get_elementGUI_main(frame, elementName)
    if frame == nil then return end
    local defMain = ritnmods.gedit.defines.gui.editor_main

    if elementName == "dropSource" then 
        return frame[defMain.corpMain.name][defMain.corpSource.name][defMain.dropSource.name]
    elseif elementName == "listChildren" then 
        return frame[defMain.corpMain.name][defMain.listChildren.name]
    end
end







--------------
local flib = {}
flib.get_elementGUI_main = get_elementGUI_main

--------------
return flib