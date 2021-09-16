---------------------------------------------------------------------------------------------
local flib = {}
flib.global =      require(ritnmods.gedit.defines.lib.functions.global)
---------------------------------------------------------------------------------------------

-- Properties
local visible = false
local modGui = require("mod-gui")
local width = 278


local function createButtonElement(content, source, elementName)
    -- Element : Tab (sprite-button)
    content[elementName] = ritnlib.gui.createSpriteButton(
        source,
        ritnmods.gedit.defines.gui.editor_main[elementName].name,
        ritnmods.gedit.defines.gui.editor_main[elementName].sprite,
        "slot_button",
        ritnmods.gedit.defines.gui.editor_main[elementName].tooltip
    )
end





-- Creation du gui
local function create(LuaPlayer)
    local screen = LuaPlayer.gui.screen
    local content = {}

    -- Main
    content.main = ritnlib.gui.createFrame(
        screen,
        ritnmods.gedit.defines.gui.editor_main.frame.name,
        ritnmods.gedit.defines.gui.editor_main.frame.caption
    )
    content.main.style.top_padding = 4
    content.main.style.right_padding = 4
    content.main.style.left_padding = 4
    content.main.style.width = width

    if global.gedit.players[LuaPlayer.name].main.last_x == -1 
    and global.gedit.players[LuaPlayer.name].main.last_x == -1 then
        ritnlib.gui.frameAutoCenter(content.main)
    else
        content.main.location = {
            global.gedit.players[LuaPlayer.name].main.last_x,
            global.gedit.players[LuaPlayer.name].main.last_y
        }
    end
    
    -- Header (flow)
    content.header = ritnlib.gui.createFlowH(
        content.main,
        ritnmods.gedit.defines.gui.editor_main.header.name
    )
    content.header.drag_target = content.main
    content.header.style.vertically_stretchable = false

    -- title (label)
    content.title = ritnlib.gui.createLabel(
        content.header,
        ritnmods.gedit.defines.gui.editor_main.title.name,
        ritnmods.gedit.defines.gui.editor_main.title.caption
    )
    content.title.style = "frame_title"
    content.title.drag_target = content.main

    -- drag (empty-widget)
    content.drag = ritnlib.gui.createEmptyWidget(content.header)
    content.drag.name = ritnmods.gedit.defines.gui.editor_main.drag.name
    content.drag.style = ritnmods.gedit.defines.gui.editor_main.drag.style
    content.drag.drag_target = content.main
    content.drag.style.right_margin = 8
    content.drag.style.height = 24
    content.drag.style.horizontally_stretchable = true
    content.drag.style.vertically_stretchable = true

    content.buttonClose = ritnlib.gui.createSpriteButton(
        content.header,
        ritnmods.gedit.defines.gui.editor_main.buttonClose.name,
        ritnmods.gedit.defines.gui.editor_main.buttonClose.sprite,
        "frame_action_button",
        ritnmods.gedit.defines.gui.editor_main.buttonClose.tooltip
    )
    content.buttonClose.mouse_button_filter = {'left'}
  
    -- corp de la frame - partie source (flow)
    content.corpMain = ritnlib.gui.createFlowV(
        content.main,
        ritnmods.gedit.defines.gui.editor_main.corpMain.name
    )
    content.corpMain.style.horizontally_stretchable = true
    content.corpMain.style.vertically_stretchable = true
    content.corpMain.style.width = width - 16
    content.corpMain.style.height = 490

    -- corp de la partie - Source
    content.corpSource = ritnlib.gui.createFlowH(
        content.corpMain,
        ritnmods.gedit.defines.gui.editor_main.corpSource.name
    )
    content.corpSource.style.horizontally_stretchable = true
    content.corpSource.style.vertically_stretchable = true
    content.corpSource.style.width = width - 16
    content.corpSource.style.height = 32

    -- button back (source)
    content.buttonBackSource = ritnlib.gui.createSpriteButton(
        content.corpSource,
        ritnmods.gedit.defines.gui.editor_main.buttonBackSource.name,
        ritnmods.gedit.defines.gui.editor_main.buttonBackSource.sprite,
        "frame_action_button"
    )
    content.buttonBackSource.style.size = 28

    -- Drop-Down (source)
    content.dropSource = ritnlib.gui.createDropDown(
        content.corpSource,
        ritnmods.gedit.defines.gui.editor_main.dropSource.name
    )
    content.dropSource.style.width = width - 48

    local table_source = global.gedit.players[LuaPlayer.name].table_name
    for _,item in pairs(table_source) do 
        content.dropSource.add_item(item)
    end
    content.dropSource.selected_index = global.gedit.players[LuaPlayer.name].main.source_index


    -- list des enfants de la source
    content.listChildren = ritnlib.gui.createList(
        content.corpMain,
        ritnmods.gedit.defines.gui.editor_main.listChildren.name
    )
    content.listChildren.style.width = width - 16
    content.listChildren.style.height = 253

    local children = flib.global.get_children(LuaPlayer)

    for _,item in pairs(children) do 
        content.listChildren.add_item(item)
    end
    content.listChildren.selected_index = global.gedit.players[LuaPlayer.name].main.children_selected_index

    -- flow button source :
    content.FlowButtonSource = ritnlib.gui.createFlowH(
        content.corpMain,
        ritnmods.gedit.defines.gui.editor_main.FlowButtonSource.name
    )
    content.FlowButtonSource.style.horizontally_stretchable = true
    content.FlowButtonSource.style.vertically_stretchable = true
    content.FlowButtonSource.style.width = width - 16
    content.FlowButtonSource.style.height = 32

    -- button Suppression (source)
    content.buttonSuppr = ritnlib.gui.createSpriteButton(
        content.FlowButtonSource,
        ritnmods.gedit.defines.gui.editor_main.buttonSupprSource.name,
        ritnmods.gedit.defines.gui.editor_main.buttonSupprSource.sprite,
        "frame_action_button",
        ritnmods.gedit.defines.gui.editor_main.buttonSupprSource.tooltip
    )
    content.buttonSuppr.style.size = 28

    -- empty-widget 
    content.emptyButtonSourceMini = ritnlib.gui.createEmptyWidget(content.FlowButtonSource)
    content.emptyButtonSourceMini.style.height = 28
    content.emptyButtonSourceMini.style.width = 5

    -- button propriétés (source)
    content.buttonParam = ritnlib.gui.createSpriteButton(
        content.FlowButtonSource,
        ritnmods.gedit.defines.gui.editor_main.buttonParamSource.name,
        ritnmods.gedit.defines.gui.editor_main.buttonParamSource.sprite,
        "frame_action_button",
        ritnmods.gedit.defines.gui.editor_main.buttonParamSource.tooltip
    )
    content.buttonParam.style.size = 28
    

    -- empty-widget 
    content.emptyButtonSource = ritnlib.gui.createEmptyWidget(content.FlowButtonSource)
    content.emptyButtonSource.style.height = 28
    content.emptyButtonSource.style.width = width - 121
   
    -- button Validation (source)
    content.buttonValid = ritnlib.gui.createSpriteButton(
        content.FlowButtonSource,
        ritnmods.gedit.defines.gui.editor_main.buttonValidSource.name,
        ritnmods.gedit.defines.gui.editor_main.buttonValidSource.sprite,
        "frame_action_button",
        ritnmods.gedit.defines.gui.editor_main.buttonValidSource.tooltip
    )
    content.buttonValid.style.size = 28

    -- ligne de séparation
    content.LineSource = ritnlib.gui.createLineH(
        content.corpMain,
        ritnmods.gedit.defines.gui.editor_main.LineSource.name
    )

    -- Label Elements :
    content.labelElements = ritnlib.gui.createLabel(
        content.corpMain,
        ritnmods.gedit.defines.gui.editor_main.labelElements.name,
        ritnmods.gedit.defines.gui.editor_main.labelElements.caption
    )
    content.labelElements.style.font = ritnmods.gedit.defines.styles.font.bold14


    -- Frame qui contient tout les elements
    content.chooseElement = ritnlib.gui.createFrame(
        content.corpMain,
        ritnmods.gedit.defines.gui.editor_main.chooseElement.name,
        ritnmods.gedit.defines.gui.editor_main.chooseElement.caption
    )
    content.chooseElement.style = ritnmods.gedit.defines.gui.editor_main.chooseElement.style
    content.chooseElement.style.width = width - 16
    content.chooseElement.style.height = 126

    -- Flow : ligne d'element 1
    content.FlowElement1 = ritnlib.gui.createFlowH(
        content.chooseElement,
        ritnmods.gedit.defines.gui.editor_main.FlowElement1.name
    )
    content.FlowElement1.style.horizontally_stretchable = true
    content.FlowElement1.style.vertically_stretchable = true
    content.FlowElement1.style.width = width - 18
    content.FlowElement1.style.height = 42

    -- Flow : ligne d'element 2
    content.FlowElement2 = ritnlib.gui.createFlowH(
        content.chooseElement,
        ritnmods.gedit.defines.gui.editor_main.FlowElement2.name
    )
    content.FlowElement2.style.horizontally_stretchable = true
    content.FlowElement2.style.vertically_stretchable = true
    content.FlowElement2.style.width = width - 18
    content.FlowElement2.style.height = 42

    -- Flow : ligne d'element 3
    content.FlowElement3 = ritnlib.gui.createFlowH(
        content.chooseElement,
        ritnmods.gedit.defines.gui.editor_main.FlowElement3.name
    )
    content.FlowElement3.style.horizontally_stretchable = true
    content.FlowElement3.style.vertically_stretchable = true
    content.FlowElement3.style.width = width - 18
    content.FlowElement3.style.height = 42


    content.element = {}
    -- Element : Tab (sprite-button)
    createButtonElement(
        content.element,
        content.FlowElement1,
        "elementTab"
    )
    content.element.elementTab.visible = flib.global.get_visible_byType(LuaPlayer, "tab")

    -- Element : Flow (sprite-button)
    createButtonElement(
        content.element,
        content.FlowElement1,
        "elementFlow"
    )
    content.element.elementFlow.visible = flib.global.get_visible_byType(LuaPlayer, "flow")
    
    -- Element : Frame (sprite-button)
    createButtonElement(
        content.element,
        content.FlowElement1,
        "elementFrame"
    )
    content.element.elementFrame.visible = flib.global.get_visible_byType(LuaPlayer, "frame")

    -- Element : Scroll Pane (sprite-button)
    createButtonElement(
        content.element,
        content.FlowElement1,
        "elementScroll"
    )
    content.element.elementScroll.visible = flib.global.get_visible_byType(LuaPlayer, "scroll-pane")

    -- Element : Sprite (sprite-button)
    createButtonElement(
        content.element,
        content.FlowElement1,
        "elementSprite"
    )
    content.element.elementSprite.visible = flib.global.get_visible_byType(LuaPlayer, "sprite")

    -- Element : Empty-Widget (sprite-button)
    createButtonElement(
        content.element,
        content.FlowElement1,
        "elementEmpty"
    )
    content.element.elementEmpty.visible = flib.global.get_visible_byType(LuaPlayer, "empty-widget")

    -- Element : Tabbed-Pane (sprite-button)
    createButtonElement(
        content.element,
        content.FlowElement1,
        "elementTabbedPane"
    )
    content.element.elementTabbedPane.visible = flib.global.get_visible_byType(LuaPlayer, "tabbed-pane")

    -- Element : SpriteButton (sprite-button)
    createButtonElement(
        content.element,
        content.FlowElement2,
        "elementSpriteButton"
    )
    content.element.elementSpriteButton.visible = flib.global.get_visible_byType(LuaPlayer, "sprite-button")

    -- Element : Button (sprite-button)
    createButtonElement(
        content.element,
        content.FlowElement2,
        "elementButton"
    )
    content.element.elementButton.visible = flib.global.get_visible_byType(LuaPlayer, "button")

    -- Element : Label (sprite-button)
    createButtonElement(
        content.element,
        content.FlowElement2,
        "elementLabel"
    )
    content.element.elementLabel.visible = flib.global.get_visible_byType(LuaPlayer, "label")

    -- Element : TextField (sprite-button)
    createButtonElement(
        content.element,
        content.FlowElement2,
        "elementTextfield"
    )
    content.element.elementTextfield.visible = flib.global.get_visible_byType(LuaPlayer, "textfield")
    
    -- Element : TextBox (sprite-button)
    createButtonElement(
        content.element,
        content.FlowElement2,
        "elementTextbox"
    )
    content.element.elementTextbox.visible = flib.global.get_visible_byType(LuaPlayer, "textbox")

    -- Element : Listbox (sprite-button)
    createButtonElement(
        content.element,
        content.FlowElement2,
        "elementListbox"
    )
    content.element.elementListbox.visible = flib.global.get_visible_byType(LuaPlayer, "listbox")


    -- Element : Checkbox (sprite-button)
    createButtonElement(
        content.element,
        content.FlowElement3,
        "elementDropDown"
    )
    content.element.elementDropDown.visible = flib.global.get_visible_byType(LuaPlayer, "drop-down")

    -- Element : Checkbox (sprite-button)
    createButtonElement(
        content.element,
        content.FlowElement3,
        "elementCheckbox"
    )
    content.element.elementCheckbox.visible = flib.global.get_visible_byType(LuaPlayer, "checkbox")

    -- Element : Radio (sprite-button)
    createButtonElement(
        content.element,
        content.FlowElement3,
        "elementRadio"
    )
    content.element.elementRadio.visible = flib.global.get_visible_byType(LuaPlayer, "radiobutton")

    -- Element : Line (sprite-button)
    createButtonElement(
        content.element,
        content.FlowElement3,
        "elementLine"
    )
    content.element.elementLine.visible = flib.global.get_visible_byType(LuaPlayer, "line")

    -- Element : Progressbar (sprite-button)
    createButtonElement(
        content.element,
        content.FlowElement3,
        "elementProgressBar"
    )
    content.element.elementProgressBar.visible = flib.global.get_visible_byType(LuaPlayer, "progressbar")

    -- Element : Slider (sprite-button)
    createButtonElement(
        content.element,
        content.FlowElement3,
        "elementSlider"
    )
    content.element.elementSlider.visible = flib.global.get_visible_byType(LuaPlayer, "slider")

    -- Element : Table (sprite-button)
    createButtonElement(
        content.element,
        content.FlowElement3,
        "elementTable"
    )
    content.element.elementTable.visible = flib.global.get_visible_byType(LuaPlayer, "table")

end



-- close gui
local function close(LuaPlayer)
    local screen = LuaPlayer.gui.screen
    local frame = screen[ritnmods.gedit.defines.gui.editor_main.frame.name]

    if frame then 
        global.gedit.players[LuaPlayer.name].main.last_x = frame.location.x
        global.gedit.players[LuaPlayer.name].main.last_y = frame.location.y
        
        frame.destroy()
    end
end

-- open gui
local function open(LuaPlayer)
    close(LuaPlayer)
    create(LuaPlayer)
    --LuaPlayer.print("Gui_Editor -> Open")
end


-----------------------------------
local luaGui = {}

luaGui.open = open
luaGui.close = close

return luaGui