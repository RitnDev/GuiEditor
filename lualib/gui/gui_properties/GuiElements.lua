---------------------------------------------------------------------------------------------
local flib = {}
--flib.global =      require(ritnmods.gedit.defines.lib.functions.global)
---------------------------------------------------------------------------------------------

-- Properties
local visible = false
local modGui = require("mod-gui")
local width = 380
local indexElement = 1


local function create(LuaPlayer, type, GuiElementName)
    local screen = LuaPlayer.gui.screen
    local defGuiProp = ritnmods.gedit.defines.gui.editor_prop
    local content = {}

    -- verification que GuiElementName n'est pas null,
    -- sinon on met un nom par défaut
    if GuiElementName == nil then 
        GuiElementName = type .. indexElement
    end

    -- Main
    content.main = ritnlib.gui.createFrame(
        screen,
        defGuiProp.frame.name,
        {"caption.editor_prop-titre", GuiElementName}
    )
    content.main.style.top_padding = 4
    content.main.style.right_padding = 4
    content.main.style.left_padding = 4
    content.main.style.width = width
    content.main.style.height = 400

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


    -- ScrollPane Properties
    content.ScrollProp = ritnlib.gui.createScrollPane(
        content.main,
        defGuiProp.ScrollProp.name
    )
    content.ScrollProp.style.horizontally_stretchable = true
    content.ScrollProp.style.vertically_stretchable = true
    content.ScrollProp.style.width = width - 16


    -- MainFlow Properties
    content.MainFlowProp = ritnlib.gui.createFlowH(
        content.ScrollProp,
        defGuiProp.MainFlowProp.name
    )
    content.MainFlowProp.style.horizontally_stretchable = true
    content.MainFlowProp.style.vertically_stretchable = true
    content.MainFlowProp.style.width = width - 35

    -- FlowProp (colonne) Name
    content.FlowPropName = ritnlib.gui.createFlowV(
        content.MainFlowProp,
        defGuiProp.FlowPropName.name
    )
    content.FlowPropName.style.horizontally_stretchable = true
    content.FlowPropName.style.vertically_stretchable = true

    content.lineProp = ritnlib.gui.createLineV(
        content.MainFlowProp,
        defGuiProp.lineProp.name
    )

    -- FlowProp (colonne) Value
    content.FlowPropValue = ritnlib.gui.createFlowV(
        content.MainFlowProp,
        defGuiProp.FlowPropValue.name
    )
    content.FlowPropValue.style.horizontally_stretchable = true
    content.FlowPropValue.style.vertically_stretchable = true


    -- empty-widget 
    content.emptyFoot = ritnlib.gui.createEmptyWidget(content.main)
    content.emptyFoot.style.height = 11
    content.emptyFoot.style.width = width - 16

    -- FlowPropButton
    content.FlowPropButton = ritnlib.gui.createFlowH(
        content.main,
        defGuiProp.FlowPropButton.name
    )
    content.FlowPropButton.style.horizontally_stretchable = true
    content.FlowPropButton.style.width = width - 35


    -- Button Close
    content.PropButtonClose = ritnlib.gui.createButton(
        content.FlowPropButton,
        defGuiProp.PropButtonClose.name,
        {"gui.cancel"},
        "red_back_button"
        )
    ritnlib.styles.ritn_small_button(content.PropButtonClose.style)

    -- empty widget
    content.emptyButton = ritnlib.gui.createEmptyWidget(content.FlowPropButton)
    content.emptyButton.style.height = 30
    content.emptyButton.style.width = width - 235

    
    -- valid_button
    content.PropButtonValid = ritnlib.gui.createButton(
        content.FlowPropButton,
        defGuiProp.PropButtonValid.name,
        {"gui.confirm"},
        "confirm_button"
    )
    ritnlib.styles.ritn_small_button(content.PropButtonValid.style)
    content.PropButtonValid.style.width = 120





    for i = 1, 8 do 

        -- Flow Prop i (name)
        content["FlowPropName" .. i] = ritnlib.gui.createFlowH(
            content.FlowPropName,
            defGuiProp["FlowPropName" .. i].name
        )
        content["FlowPropName" .. i].style.horizontally_stretchable = true
        content["FlowPropName" .. i].style.vertically_stretchable = true
        content["FlowPropName" .. i].style.vertical_align = "center"
        content["FlowPropName" .. i].style.height = 32

        -- Flow Prop i (value)
        content["FlowPropValue" .. i] = ritnlib.gui.createFlowH(
            content.FlowPropValue,
            defGuiProp["FlowPropValue" .. i].name
        )
        content["FlowPropValue" .. i].style.horizontally_stretchable = true
        content["FlowPropValue" .. i].style.vertically_stretchable = true
        content["FlowPropValue" .. i].style.vertical_align = "center"
        content["FlowPropValue" .. i].style.height = 32


        --------- PARTIE NAME

        -- Label Prop i (name)
        content["LabelProp" .. i .. "Name"] = ritnlib.gui.createLabel(
            content["FlowPropName" .. i],
            defGuiProp["LabelProp" .. i .. "Name"].name,
            defGuiProp["LabelProp" .. i .. "Name"].caption
        )
        content["LabelProp" .. i .. "Name"].style.font = ritnmods.gedit.defines.styles.font.bold14

    end

    

    --------- PARTIE VALUE


    ---- Propriété 1 (Nom)

    -- Label Info Prop 1 (value)
    local ui_name = global.gedit.players[LuaPlayer.name].parametres.ui_name
    local sep = global.gedit.players[LuaPlayer.name].parametres.separateur

    content.LabelProp1Info = ritnlib.gui.createLabel(
        content.FlowPropValue1,
        defGuiProp.LabelProp1Info.name,
        ui_name .. sep .. type .. sep
    )
   
    -- Textfield Prop 1 (value)
    content.textProp1Value = ritnlib.gui.createTextField(
        content.FlowPropValue1,
        defGuiProp.textProp1Value.name,
        GuiElementName
    )
    content.textProp1Value.style.width = 130


    ---- Propriété 2 (Caption)

    -- Textfield Prop 2
    content.textProp2Value = ritnlib.gui.createTextField(
        content.FlowPropValue2,
        defGuiProp.textProp2Value.name,
        defGuiProp.textProp2Value.caption
    )
    content.textProp2Value.style.width = 222


    ---- Propriété 3 (direction)
    content.dropProp3Value = ritnlib.gui.createDropDown(
        content.FlowPropValue3,
        defGuiProp.dropProp3Value.name
    )
    for _,item in pairs(defGuiProp.dropProp3Value.items) do 
        content.dropProp3Value.add_item(item)
    end
    content.dropProp3Value.selected_index = defGuiProp.dropProp3Value.selected_index


    ---- Propriété 4 (visible)
    content.checkProp4Value = ritnlib.gui.createCheckbox(
        content.FlowPropValue4,
        defGuiProp.checkProp4Value.name
    )
    content.LabelProp4Info = ritnlib.gui.createLabel(
        content.FlowPropValue4,
        defGuiProp.LabelProp4Info.name,
        defGuiProp.LabelProp4Info.caption
    )
    content.checkProp4Info = ritnlib.gui.createCheckbox(
        content.FlowPropValue4,
        defGuiProp.checkProp4Info.name
    )


    ---- Propriété 5 (Texte)

    -- Textfield Prop 5
    content.textProp5Value = ritnlib.gui.createTextField(
        content.FlowPropValue5,
        defGuiProp.textProp5Value.name
    )
    content.textProp5Value.style.width = 222


    ---- Propriété 6 (état)
    content.checkProp6Value = ritnlib.gui.createCheckbox(
        content.FlowPropValue6,
        defGuiProp.checkProp6Value.name
    )
    content.LabelProp6Info = ritnlib.gui.createLabel(
        content.FlowPropValue6,
        defGuiProp.LabelProp6Info.name,
        defGuiProp.LabelProp6Info.caption
    )


    ---- Propriété 7 (Largeur)

    -- Textfield Prop 7
    content.textProp7Value = ritnlib.gui.createTextField(
        content.FlowPropValue7,
        defGuiProp.textProp7Value.name,
        ""
    )
    content.textProp7Value.style.width = 80


    ---- Propriété 8 (Hauteur)

    -- Textfield Prop 8
    content.textProp8Value = ritnlib.gui.createTextField(
        content.FlowPropValue8,
        defGuiProp.textProp8Value.name,
        ""
    )
    content.textProp8Value.style.width = 80

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
local function open(LuaPlayer, type)
    close(LuaPlayer)
    create(LuaPlayer, type)
end


-----------------------------------
local luaGui = {}

luaGui.open = open
luaGui.close = close

return luaGui