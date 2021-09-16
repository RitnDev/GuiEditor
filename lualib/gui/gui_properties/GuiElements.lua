---------------------------------------------------------------------------------------------
local flib = {}
--flib.global =      require(ritnmods.gedit.defines.lib.functions.global)
---------------------------------------------------------------------------------------------

-- Properties
local visible = false
local modGui = require("mod-gui")
local width = 310


local function create(LuaPlayer)
    local screen = LuaPlayer.gui.screen
    local defGuiProp = ritnmods.gedit.defines.gui.editor_prop
    local content = {}

    -- Main
    content.main = ritnlib.gui.createFrame(
        screen,
        defGuiProp.frame.name,
        defGuiProp.frame.caption
    )
    content.main.style.top_padding = 4
    content.main.style.right_padding = 4
    content.main.style.left_padding = 4
    content.main.style.width = width

    if global.gedit.players[LuaPlayer.name].prop.last_x == -1 
    and global.gedit.players[LuaPlayer.name].prop.last_x == -1 then
        ritnlib.gui.frameAutoCenter(content.main)
    else
        content.main.location = {
            global.gedit.players[LuaPlayer.name].prop.last_x,
            global.gedit.players[LuaPlayer.name].prop.last_y
        }
    end

    -- empty-widget 
    content.emptyHead = ritnlib.gui.createEmptyWidget(content.main)
    content.emptyHead.style.height = 3
    content.emptyHead.style.width = width - 16


    -- MainFlow Properties
    content.MainFlowProp = ritnlib.gui.createFlowH(
        content.main,
        "gedit-flow-MainFlowProp"
    )
    content.MainFlowProp.style.horizontally_stretchable = true
    content.MainFlowProp.style.vertically_stretchable = true
    content.MainFlowProp.style.width = width - 16

    -- FlowProp Name
    content.FlowPropName = ritnlib.gui.createFlowV(
        content.MainFlowProp,
        "gedit-flow-FlowPropName"
    )
    content.FlowPropName.style.horizontally_stretchable = true
    content.FlowPropName.style.vertically_stretchable = true

    content.lineProp = ritnlib.gui.createLineV(
        content.MainFlowProp,
        "gedit-line-lineProp"
    )

    -- FlowProp Value
    content.FlowPropValue = ritnlib.gui.createFlowV(
        content.MainFlowProp,
        "gedit-flow-FlowPropValue"
    )
    content.FlowPropValue.style.horizontally_stretchable = true
    content.FlowPropValue.style.vertically_stretchable = true





    -- Flow Prop 1 (name)
    content.FlowPropName1 = ritnlib.gui.createFlowH(
        content.FlowPropName,
        "gedit-flow-prop1_name"
    )
    content.FlowPropName1.style.horizontally_stretchable = true
    content.FlowPropName1.style.vertically_stretchable = true
    content.FlowPropName1.style.vertical_align = "center"
    content.FlowPropName1.style.height = 32

    -- Label Prop 1
    content.LabelProp1Name = ritnlib.gui.createLabel(
        content.FlowPropName1,
        "gedit-label-prop1_name",
        "Nom :"
    )
    content.LabelProp1Name.style.font = ritnmods.gedit.defines.styles.font.bold14


    -- Flow Prop 1 (value)
    content.FlowPropValue1 = ritnlib.gui.createFlowH(
        content.FlowPropValue,
        "gedit-flow-prop1_value"
    )
    content.FlowPropValue1.style.horizontally_stretchable = true
    content.FlowPropValue1.style.vertically_stretchable = true
    content.FlowPropValue1.style.vertical_align = "center"
    content.FlowPropValue1.style.height = 32

    -- Label Prop 1
    local ui_name = global.gedit.players[LuaPlayer.name].parametres.ui_name
    local sep = global.gedit.players[LuaPlayer.name].parametres.separateur
    local element_name = "frame"

    content.LabelProp1Info = ritnlib.gui.createLabel(
        content.FlowPropValue1,
        "gedit-label-prop1_info",
        ui_name .. sep .. element_name .. sep
    )
   
    local num = 1

    -- Textfield Prop 1
    content.textProp1Value = ritnlib.gui.createTextField(
        content.FlowPropValue1,
        "gedit-text-prop1_value",
        element_name .. num
    )
    content.textProp1Value.style.width = 130




    -- Flow Prop 2 (name)
    content.FlowPropName2 = ritnlib.gui.createFlowH(
        content.FlowPropName,
        "gedit-flow-prop2_name"
    )
    content.FlowPropName2.style.horizontally_stretchable = true
    content.FlowPropName2.style.vertically_stretchable = true
    content.FlowPropName2.style.vertical_align = "center"
    content.FlowPropName2.style.height = 32

    -- Label Prop 2
    content.LabelProp2Name = ritnlib.gui.createLabel(
        content.FlowPropName2,
        "gedit-label-prop2_name",
        "Caption :"
    )
    content.LabelProp2Name.style.font = ritnmods.gedit.defines.styles.font.bold14


    -- Flow Prop 2 (value)
    content.FlowPropValue2 = ritnlib.gui.createFlowH(
        content.FlowPropValue,
        "gedit-flow-prop2_value"
    )
    content.FlowPropValue2.style.horizontally_stretchable = true
    content.FlowPropValue2.style.vertically_stretchable = true
    content.FlowPropValue2.style.vertical_align = "center"
    content.FlowPropValue2.style.height = 32


    -- Textfield Prop 2
    content.textProp2Value = ritnlib.gui.createTextField(
        content.FlowPropValue2,
        "gedit-text-prop2_value",
        "caption"
    )
    content.textProp2Value.style.width = 222

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