-- INITIALISATION VARIABLES GLOBALS

---------------------
-->       _G
---------------------

-- Variable global ritnmods permettant le lien avec d'autres mods Ritnmods
if not ritnlib then require("__RitnLib__/defines") end
  ritnlib.gui = require(ritnlib.defines.gui)
  ritnlib.styles = require(ritnlib.defines.styles)


  
if not ritnmods then ritnmods = {
    gedit = {
    -- definitions des constantes
    defines = require("core/defines"),
    },
} end



---------------------
-->   global (jeu)
---------------------

-- Enregistrement des données permettant la gestion de la téléportation.
if not global.gedit then global.gedit = 
    {
        players = {},
        elements = {
            ["frame"] = {
                "flow",
                "frame",
                "sprite-button",
                "button",
                "label",
                "textfield",
                "textbox",
                "empty-widget",
                "scroll-pane",
                "listbox",
                "drop-down",
                "checkbox",
                "radiobutton",
                "tabbed-pane",
                --"tab",
                "sprite",
                "line",
                "progressbar",
                "slider",
                --"table"
            },
            ["flow"] = {
              "flow",
              "frame",
              "sprite-button",
              "button",
              "label",
              "textfield",
              "textbox",
              "empty-widget",
              "scroll-pane",
              "listbox",
              "drop-down",
              "checkbox",
              "radiobutton",
              "tabbed-pane",
              --"tab",
              "sprite",
              "line",
              "progressbar",
              "slider",
              --"table"
            },
            
          ["tabbed-pane"] = {
            --"flow",
            --"frame",
            --"sprite-button",
            --"button",
            --"label",
            --"textfield",
            --"textbox",
            --"empty-widget",
            --"scroll-pane",
            --"listbox",
            --"drop-down",
            --"checkbox",
            --"radiobutton",
            --"tabbed-pane",
            "tab",
            --"sprite",
            --"line",
            --"progressbar",
            --"slider",
            --"table"
          },
          ["sprite"] = {
            "flow",
            --"frame",
            "sprite-button",
            "button",
            "label",
            "textfield",
            "textbox",
            "empty-widget",
            "scroll-pane",
            "listbox",
            "drop-down",
            "checkbox",
            "radiobutton",
            --"tabbed-pane",
            --"tab",
            "sprite",
            "line",
            "progressbar",
            "slider",
            --"table"
          },
          ["empty-widget"] = {
            "flow",
            "frame",
            "sprite-button",
            "button",
            "label",
            "textfield",
            "textbox",
            "empty-widget",
            "scroll-pane",
            "listbox",
            "drop-down",
            "checkbox",
            "radiobutton",
            "tabbed-pane",
            --"tab",
            "sprite",
            "line",
            "progressbar",
            "slider",
            --"table"
          },
          ["scroll-pane"] = {
            "flow",
            "frame",
            "sprite-button",
            "button",
            "label",
            "textfield",
            "textbox",
            "empty-widget",
            "scroll-pane",
            "listbox",
            "drop-down",
            "checkbox",
            "radiobutton",
            "tabbed-pane",
            --"tab",
            "sprite",
            "line",
            "progressbar",
            "slider",
            --"table"
          },
          ["button"] = {},
          ["label"] = {},
          ["sprite-button"] = {},
          ["textfield"] = {},
          ["textbox"] = {},
          ["drop-down"] = {},
          ["checkbox"] = {},
          ["radiobutton"] = {},
          ["line"] = {},
          ["progressbar"] = {},
          ["slider"] = {},
          ["tab"] = {},
          ["none"] = {},


        }
    }
end
