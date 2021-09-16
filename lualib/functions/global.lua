-- Fonctions "player"

local function new_player_global()
    return {
        main = {
            last_x = -1,
            last_y = -1,
            source_origine = "gui",
            source_show = "gui",
            children_selected = "top",
            children_selected_index = 1,
            children_selected_type = "flow",
            source_index = 1,
            path_source = {
                ["gui"] = {
                    name = "gui",
                    index = 1,
                    type = "none",
                    parent = "",
                    children = {
                        ["top"] = {
                            name = "top",
                            index = 2,
                            type = "flow",
                            parent = "gui",
                            children = {},
                            default = true
                        },
                        ["left"] = {
                            name = "left",
                            index = 2,
                            type = "flow",
                            parent = "gui",
                            children = {},
                            default = true
                        },
                        ["screen"] = {
                            name = "screen",
                            index = 2,
                            type = "flow",
                            parent = "gui",
                            children = {},
                            default = true
                        },
                        ["center"] = {
                            name = "center",
                            index = 2,
                            type = "flow",
                            parent = "gui",
                            children = {},
                            default = true
                        }
                    },
                    default = true
                },
            },
        },
        prop = {
            last_x = -1,
            last_y = -1,
        },
        table_name = {
            "gui",
        }
    }
end



local function get_children(LuaPlayer) 
    if not global.gedit.players[LuaPlayer.name] then return end

    local table_name = global.gedit.players[LuaPlayer.name].table_name
    local source = global.gedit.players[LuaPlayer.name].main.path_source["gui"]

    if #table_name ~= 1 then 
        for i = 2, #table_name do 
            source = source.children[table_name[i]]
        end
    end

    local table_children = {}
    for i,v in pairs(source.children) do 
        table.insert(table_children, i)
    end
    return table_children
end

-- renvoie le type d'un enfants selectionnée
local function get_type_children(LuaPlayer) 
    if not global.gedit.players[LuaPlayer.name] then return end

    local children_name = global.gedit.players[LuaPlayer.name].main.children_selected
    local source = global.gedit.players[LuaPlayer.name].main.path_source["gui"]
    local table_name = global.gedit.players[LuaPlayer.name].table_name
    table.insert(table_name, children_name)
    
    if #table_name ~= 1 then 
        for i = 2, #table_name do 
            source = source.children[table_name[i]]
        end
    end

    return source.type
end

-- verifie si on peut créer cette objet depuis la source selectionnée
-- rend invisible le bouton s'il n'est pas listé dans les elements pouvant être créer.
local function get_visible_byType(LuaPlayer, elementName)
    if not global.gedit.players[LuaPlayer.name] then return false end
    local children_type = global.gedit.players[LuaPlayer.name].main.children_selected_type
    local tab_type = global.gedit.elements[children_type]

    for _,element in pairs(tab_type) do 
        if element == elementName then 
            return true
        end
    end
    return false
end







-- Ajoute un nouvelle element à la liste, renvoie true si c'est OK
local function new_gui_source(LuaPlayer, parent_name, index, name)
    local list_name = global.gedit.players[LuaPlayer.name].main.list_name
    --[[
    for _,vName in pairs(list_name) do 
        if vName == name then 
            return false
        end
    end
        
    local path_source = global.gedit.players[LuaPlayer.name].main.path_source
    local newindex = index + 1
    -- ajout de l'enfant
    for i,value in pairs(path_source) do 
        if i == parent_name then 
            if value.index == index then 
                table.insert(value.children, name)
            end
        end
    end
    --ajout de la structure
    path_source[name] = {
        name = name,
        index = newindex,
        parent = parent_name,
        children = {},
        default = false,
    }
    -- ajout à la liste des noms
    table.insert(list_name, name)

    return true]]
end





--------------
local flib = {}
flib.new_player_global = new_player_global
flib.get_children = get_children
flib.get_type_children = get_type_children
flib.get_visible_byType = get_visible_byType

--------------
return flib