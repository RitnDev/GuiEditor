-----------------------------------------
--               DEFINES               --
-----------------------------------------
local defines = {}

defines.name_prefix = "ritnmods-gedit-"
defines.mod_name = "gedit"
defines.source = "__GuiEditor__"


-- Modules
local modules = "lualib/modules/"
defines.modules = {
    core = "core/modules",
    gui = {
        editor_main = modules .. "gui_editor_main",
        properties = modules .. "gui_properties",
    },
    player = modules .. "player",
    events = modules .. "events",
}

-- Module GUI :
local libGui = "lualib/gui/"
local libFunc = "lualib/functions/"
defines.lib = {
    gui = {
        main = {
            action = libGui .. "editor_main/action",
            GuiElements = libGui .. "editor_main/GuiElements"
        },
        prop = {
            action = libGui .. "gui_properties/action",
            GuiElements = libGui .. "gui_properties/GuiElements"
        },
    },
    functions = {
        global = libFunc .. "global",
        gui = libFunc .. "gui",
    }
}


-- styles
defines.styles = {
    sprite = {
        back_source = "sprite-back-source",
        valider = "sprite-valider",
        suppr = "sprite-suppr",
        add = "sprite-add",
        param = "sprite-param",
        element = {
            frame = "sprite-element-frame",
            button = "sprite-element-button",
            checkbox = "sprite-element-checkbox",
            dropDown = "sprite-element-dropDown",
            empty = "sprite-element-empty",
            flow = "sprite-element-flow",
            label = "sprite-element-label",
            line = "sprite-element-line",
            listbox = "sprite-element-listbox",
            progressbar = "sprite-element-progressbar",
            radio = "sprite-element-radio",
            scrollPane = "sprite-element-scrollPane",
            slider = "sprite-element-slider",
            sprite = "sprite-element-sprite",
            spriteButton = "sprite-element-spritteButton",
            tab = "sprite-element-tab",
            tabbedPane = "sprite-element-tabbedPane",
            table = "sprite-element-table",
            textbox = "sprite-element-textbox",
            textfield = "sprite-element-textfield",
        }
    },
    font = {
        defaut12 = "ritn-default-12",
        defaut14 = "ritn-default-14",
        defaut16 = "ritn-default-16",
        defaut18 = "ritn-default-18",
        defaut20 = "ritn-default-20",
        bold12 = "ritn-default-bold-12",
        bold14 = "ritn-default-bold-14",
        bold16 = "ritn-default-bold-16",
        bold18 = "ritn-default-bold-18",
        bold20 = "ritn-default-bold-20",
    }
}

defines.customInput = {
    toggle_main_menu = defines.name_prefix .. "toggle-main-menu"
}


-- graphics
local gvv = "__gvv__/icons/"
local graphics_gui = defines.source .. "/graphics/gui/"
defines.graphics = {
    folder = {
        close = gvv .. "folder-closed",
        open = gvv .. "folder-opened",
    },
    gui = {
        back_source = graphics_gui .. "back-source.png",
        valider = graphics_gui .. "valider.png",
        suppr = graphics_gui .. "suppr.png",
        add = graphics_gui .. "add.png",
        param = graphics_gui .. "param.png",
        frame = graphics_gui .. "frame.png",
        button = graphics_gui .. "button.png",
        checkbox = graphics_gui .. "checkbox.png",
        dropDown = graphics_gui .. "drop-down.png",
        empty = graphics_gui .. "empty.png",
        flow = graphics_gui .. "flow.png",
        label = graphics_gui .. "label.png",
        line = graphics_gui .. "line.png",
        listbox = graphics_gui .. "listbox.png",
        progressbar = graphics_gui .. "progressbar.png",
        radio = graphics_gui .. "radiobutton.png",
        scrollPane = graphics_gui .. "scroll-pane.png",
        slider = graphics_gui .. "slider.png",
        sprite = graphics_gui .. "sprite.png",
        spriteButton = graphics_gui .. "sprite-button.png",
        tab = graphics_gui .. "tab.png",
        tabbedPane = graphics_gui .. "tabbed-pane.png",
        table = graphics_gui .. "table.png",
        textbox = graphics_gui .. "textbox.png",
        textfield = graphics_gui .. "textfield.png",
    }
}



-- styles
-- GUI elements names
local prefix = "gedit-"
defines.gui = {
    prefix = {
        gedit = prefix,
        build = "BUILD-",
    },

    editor_main = {
        frame = {
            name = prefix .. "frame-main",
            caption = ""
        },
        header = {
            name = prefix .. "flow-header"
        },
        title = {
            name = prefix .. "label-title",
            caption = {"caption.editor_main-titre"}
        },
        drag = {
            name = prefix .. "widget-drag",
            style = "draggable_space_header",
        },
        buttonClose = {
            name = prefix .. "button-close",
            sprite = "utility/close_white",
            tooltip = {"tooltip.editor_main-button_close"},
        },
        corpMain = {
            name = prefix .. "flow-corp_main",
        },
        corpSource = {
            name = prefix .. "flow-corp_source",
        },
        buttonBackSource = {
            name = prefix .. "button-back_source",
            sprite = defines.styles.sprite.back_source,
        },
        dropSource = {
            name = prefix .. "drop-source",
        },
        listChildren = {
            name = prefix .. "list-children",
        },
        FlowButtonSource = {
            name = prefix .. "flow-buttonSource",
        },
        buttonSupprSource = {
            name = prefix .. "button-source_suppr",
            sprite = defines.styles.sprite.suppr,
            tooltip = {"tooltip.editor_main-button_suppr"},
        },
        buttonParamSource = {
            name = prefix .. "button-source_param",
            sprite = defines.styles.sprite.param,
            tooltip = {"tooltip.editor_main-button_param"}
        },
        buttonValidSource = {
            name = prefix .. "button-source_valid",
            sprite = defines.styles.sprite.valider,
            tooltip = {"tooltip.editor_main-button_valid"}
        },
        LineSource = {
            name = prefix .. "line-source",
        },
        labelElements = {
            name = prefix .. "label-elements",
            caption = {"caption.editor_main-labelElements"}
        },
        chooseElement = {
            name = prefix .. "frame-elements",
            caption = "",
            style = "mod_gui_inside_deep_frame"
        },
        listElementFlow = {
            name = prefix .. "list-elements",
        },
        FlowButtonElement = {
            name = prefix .. "flow-buttonElement",
        },
        buttonAddElement = {
            name = prefix .. "button-element_add",
            sprite = defines.styles.sprite.add,
            tooltip = {"tooltip.editor_main-button_add"}
        },


        FlowElement1 = {
            name = prefix .. "flow-element1",
        },
        FlowElement2 = {
            name = prefix .. "flow-element2",
        },
        FlowElement3 = {
            name = prefix .. "flow-element3",
        },
        FlowElement4 = {
            name = prefix .. "flow-element4",
        },

        -- elements :
        elementFrame = {
            name = prefix .. "button-element_frame",
            sprite = defines.styles.sprite.element.frame,
            tooltip = {"tooltip.editor_main-element-frame"}
        },
        elementFlow = {
            name = prefix .. "button-element_flow",
            sprite = defines.styles.sprite.element.flow,
            tooltip = {"tooltip.editor_main-element-flow"}
        },
        elementSprite = {
            name = prefix .. "button-element_sprite",
            sprite = defines.styles.sprite.element.sprite,
            tooltip = {"tooltip.editor_main-element-sprite"}
        },
        elementSpriteButton = {
            name = prefix .. "button-element_spriteButton",
            sprite = defines.styles.sprite.element.spriteButton,
            tooltip = {"tooltip.editor_main-element-spriteButton"}
        },
        elementLabel = {
            name = prefix .. "button-element_label",
            sprite = defines.styles.sprite.element.label,
            tooltip = {"tooltip.editor_main-element-label"}
        },
        elementTextfield = {
            name = prefix .. "button-element_textfield",
            sprite = defines.styles.sprite.element.textfield,
            tooltip = {"tooltip.editor_main-element-textfield"}
        },
        elementButton = {
            name = prefix .. "button-element_button",
            sprite = defines.styles.sprite.element.button,
            tooltip = {"tooltip.editor_main-element-button"}
        },
        elementCheckbox = {
            name = prefix .. "button-element_checkbox",
            sprite = defines.styles.sprite.element.checkbox,
            tooltip = {"tooltip.editor_main-element-checkbox"}
        },
        elementDropDown = {
            name = prefix .. "button-element_dropDown",
            sprite = defines.styles.sprite.element.dropDown,
            tooltip = {"tooltip.editor_main-element-dropDown"}
        },
        elementEmpty = {
            name = prefix .. "button-element_empty",
            sprite = defines.styles.sprite.element.empty,
            tooltip = {"tooltip.editor_main-element-empty"}
        },
        elementLine = {
            name = prefix .. "button-element_line",
            sprite = defines.styles.sprite.element.line,
            tooltip = {"tooltip.editor_main-element-line"}
        },
        elementListbox = {
            name = prefix .. "button-element_listbox",
            sprite = defines.styles.sprite.element.listbox,
            tooltip = {"tooltip.editor_main-element-listbox"}
        },
        elementProgressBar = {
            name = prefix .. "button-element_progressBar",
            sprite = defines.styles.sprite.element.progressbar,
            tooltip = {"tooltip.editor_main-element-progressbar"}
        },
        elementRadio = {
            name = prefix .. "button-element_radio",
            sprite = defines.styles.sprite.element.radio,
            tooltip = {"tooltip.editor_main-element-radio"}
        },
        elementScroll = {
            name = prefix .. "button-element_scroll",
            sprite = defines.styles.sprite.element.scrollPane,
            tooltip = {"tooltip.editor_main-element-scrollPane"}
        },
        elementSlider = {
            name = prefix .. "button-element_slider",
            sprite = defines.styles.sprite.element.slider,
            tooltip = {"tooltip.editor_main-element-slider"}
        },
        elementTab = {
            name = prefix .. "button-element_tab",
            sprite = defines.styles.sprite.element.tab,
            tooltip = {"tooltip.editor_main-element-tab"}
        },
        elementTabbedPane = {
            name = prefix .. "button-element_tabbedPane",
            sprite = defines.styles.sprite.element.tabbedPane,
            tooltip = {"tooltip.editor_main-element-tabbedPane"}
        },
        elementTable = {
            name = prefix .. "button-element_table",
            sprite = defines.styles.sprite.element.table,
            tooltip = {"tooltip.editor_main-element-table"}
        },
        elementTextbox = {
            name = prefix .. "button-element_textbox",
            sprite = defines.styles.sprite.element.textbox,
            tooltip = {"tooltip.editor_main-element-textbox"}
        },

    },

    editor_prop = {
        frame = {
            name = prefix .. "frame-prop",
        },
        ScrollProp = {
            name = prefix .. "scroll-prop"
        },
        MainFlowProp = {
            name = prefix .. "flow-MainFlowProp"
        },

        -- colonne propriété
        FlowPropName = {
            name = prefix .. "flow-FlowPropName"
        },
        lineProp = {
            name = prefix .. "line-lineProp"
        },
        FlowPropValue = {
            name = prefix .. "flow-FlowPropValue"
        },

        -- Partie buttons
        FlowPropButton = {
            name = prefix .. "flow-FlowPropButton"
        },
        PropButtonClose = {
            name = prefix .. "button-close"
        },
        PropButtonValid = {
            name = prefix .. "button-valid"
        },


        -- ligne propriété
        -- Name
        FlowPropName1 = {
            name = prefix .. "flow-prop1_name"
        },
        FlowPropName2 = {
            name = prefix .. "flow-prop2_name"
        },
        FlowPropName3 = {
            name = prefix .. "flow-prop3_name"
        },
        FlowPropName4 = {
            name = prefix .. "flow-prop4_name"
        },
        FlowPropName5 = {
            name = prefix .. "flow-prop5_name"
        },
        FlowPropName6 = {
            name = prefix .. "flow-prop6_name"
        },
        FlowPropName7 = {
            name = prefix .. "flow-prop7_name"
        },
        FlowPropName8 = {
            name = prefix .. "flow-prop8_name"
        },
        FlowPropName9 = {
            name = prefix .. "flow-prop9_name"
        },
        FlowPropName10 = {
            name = prefix .. "flow-prop10_name"
        },
        FlowPropName11 = {
            name = prefix .. "flow-prop11_name"
        },
        -- Value
        FlowPropValue1 = {
            name = prefix .. "flow-prop1_value"
        },
        FlowPropValue2 = {
            name = prefix .. "flow-prop2_value"
        },
        FlowPropValue3 = {
            name = prefix .. "flow-prop3_value"
        },
        FlowPropValue4 = {
            name = prefix .. "flow-prop4_value"
        },
        FlowPropValue5 = {
            name = prefix .. "flow-prop5_value"
        },
        FlowPropValue6 = {
            name = prefix .. "flow-prop6_value"
        },
        FlowPropValue7 = {
            name = prefix .. "flow-prop7_value"
        },
        FlowPropValue8 = {
            name = prefix .. "flow-prop8_value"
        },
        FlowPropValue9 = {
            name = prefix .. "flow-prop9_value"
        },
        FlowPropValue10 = {
            name = prefix .. "flow-prop10_value"
        },
        FlowPropValue11 = {
            name = prefix .. "flow-prop11_value"
        },


        -- Label Name (prop)
        LabelProp1Name = {
            name = prefix .. "label-prop1_name",
            caption = {"caption.editor_prop-LabelProp1Name"}
        },
        LabelProp2Name = {
            name = prefix .. "label-prop2_name",
            caption = {"caption.editor_prop-LabelProp2Name"}
        },
        LabelProp3Name = {
            name = prefix .. "label-prop3_name",
            caption = {"caption.editor_prop-LabelProp3Name"}
        },
        LabelProp4Name = {
            name = prefix .. "label-prop4_name",
            caption = {"caption.editor_prop-LabelProp4Name"}
        },
        LabelProp5Name = {
            name = prefix .. "label-prop5_name",
            caption = {"caption.editor_prop-LabelProp5Name"}
        },
        LabelProp6Name = {
            name = prefix .. "label-prop6_name",
            caption = {"caption.editor_prop-LabelProp6Name"}
        },
        LabelProp7Name = {
            name = prefix .. "label-prop7_name",
            caption = {"caption.editor_prop-LabelProp7Name"}
        },
        LabelProp8Name = {
            name = prefix .. "label-prop8_name",
            caption = {"caption.editor_prop-LabelProp8Name"}
        },
        LabelProp9Name = {
            name = prefix .. "label-prop9_name",
            caption = {"caption.editor_prop-LabelProp9Name"}
        },
        LabelProp10Name = {
            name = prefix .. "label-prop10_name",
            caption = {"caption.editor_prop-LabelProp10Name"}
        },
        LabelProp11Name = {
            name = prefix .. "label-prop11_name",
            caption = {"caption.editor_prop-LabelProp11Name"}
        },

        
        LabelProp1Info = {
            name = prefix .. "label-prop1_info",
        },
        textProp1Value = {
            name = prefix .. "text-prop1_value"
        },
        textProp2Value = {
            name = prefix .. "text-prop2_value",
            caption = "caption"
        },
        dropProp3Value = {
            name = prefix .. "drop-prop3_value",
            items = {
                {"caption.editor_prop-dropProp3Value1"},
                {"caption.editor_prop-dropProp3Value2"},
            },
            selected_index = 1,
        },
        checkProp4Value = {
            name = prefix .. "check-prop4_value",
        },
        LabelProp4Info = {
            name = prefix .. "label-prop4_info",
            caption = {"caption.editor_prop-LabelProp4Info"}
        },
        checkProp4Info = {
            name = prefix .. "check-prop4_info",
        },
        textProp5Value = {
            name = prefix .. "text-prop5_value",
            caption = ""
        },
        checkProp6Value = {
            name = prefix .. "check-prop6_value",
        },
        LabelProp6Info = {
            name = prefix .. "label-prop6_info",
            caption = {"caption.editor_prop-LabelProp6Info"}
        },
        textProp7Value = {
            name = prefix .. "text-prop7_value",
        },
        textProp8Value = {
            name = prefix .. "text-prop8_value",
        },


    }

}


--------------------------
return defines