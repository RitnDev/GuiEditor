-------------------------------------------------------------------------------
                                -- FUNCTIONS
-------------------------------------------------------------------------------

-- return sprite for sprite button
local function sprite_button(name, file_name, size)
	local size_default = 32
	if size ~= nil then size_default = size end

	return {
		type = "sprite",
		name = name,
		filename = file_name,
		width = size_default,
		height = size_default,
		flags = {"gui-icon"},
		mipmap_count = 1,
	}
end



-------------------------------------------------------------------------------

                                --------------
                                --  STYLES  --
                                --------------

-------------------------------------------------------------------------------



data:extend({
	
	-- SPRITES

	-- Sprite :
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.back_source,
		ritnmods.gedit.defines.graphics.gui.back_source
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.valider,
		ritnmods.gedit.defines.graphics.gui.valider
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.suppr,
		ritnmods.gedit.defines.graphics.gui.suppr
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.add,
		ritnmods.gedit.defines.graphics.gui.add
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.param,
		ritnmods.gedit.defines.graphics.gui.param,
		40
	),
	-- sprite : elements
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.element.frame,
		ritnmods.gedit.defines.graphics.gui.frame
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.element.button,
		ritnmods.gedit.defines.graphics.gui.button
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.element.checkbox,
		ritnmods.gedit.defines.graphics.gui.checkbox,
		40
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.element.dropDown,
		ritnmods.gedit.defines.graphics.gui.dropDown
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.element.empty,
		ritnmods.gedit.defines.graphics.gui.empty
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.element.flow,
		ritnmods.gedit.defines.graphics.gui.flow
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.element.label,
		ritnmods.gedit.defines.graphics.gui.label
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.element.line,
		ritnmods.gedit.defines.graphics.gui.line
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.element.listbox,
		ritnmods.gedit.defines.graphics.gui.listbox,
		40
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.element.progressbar,
		ritnmods.gedit.defines.graphics.gui.progressbar
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.element.radio,
		ritnmods.gedit.defines.graphics.gui.radio,
		40
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.element.scrollPane,
		ritnmods.gedit.defines.graphics.gui.scrollPane,
		40
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.element.slider,
		ritnmods.gedit.defines.graphics.gui.slider
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.element.sprite,
		ritnmods.gedit.defines.graphics.gui.sprite,
		40
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.element.spriteButton,
		ritnmods.gedit.defines.graphics.gui.spriteButton
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.element.tab,
		ritnmods.gedit.defines.graphics.gui.tab,
		40
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.element.tabbedPane,
		ritnmods.gedit.defines.graphics.gui.tabbedPane,
		40
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.element.table,
		ritnmods.gedit.defines.graphics.gui.table,
		45
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.element.textbox,
		ritnmods.gedit.defines.graphics.gui.textbox,
		40
	),
	sprite_button(
		ritnmods.gedit.defines.styles.sprite.element.textfield,
		ritnmods.gedit.defines.graphics.gui.textfield
	),





	-- FONTS
	{
		type = "font",
		name = ritnmods.gedit.defines.styles.font.defaut12,
		from = "default",
		size = 12
	},
	{
		type = "font",
		name = ritnmods.gedit.defines.styles.font.defaut14,
		from = "default",
		size = 14
	},
	{
		type = "font",
		name = ritnmods.gedit.defines.styles.font.defaut16,
		from = "default",
		size = 16
	},
	{
		type = "font",
		name = ritnmods.gedit.defines.styles.font.defaut18,
		from = "default",
		size = 18
	},
	{
		type = "font",
		name = ritnmods.gedit.defines.styles.font.defaut20,
		from = "default",
		size = 20
	},
	--bold
	{
		type = "font",
		name = ritnmods.gedit.defines.styles.font.bold12,
		from = "default-bold",
		size = 12
	},
	{
		type = "font",
		name = ritnmods.gedit.defines.styles.font.bold14,
		from = "default-bold",
		size = 14
	},
	{
		type = "font",
		name = ritnmods.gedit.defines.styles.font.bold16,
		from = "default-bold",
		size = 16
	},
	{
		type = "font",
		name = ritnmods.gedit.defines.styles.font.bold18,
		from = "default-bold",
		size = 18
	},
	{
		type = "font",
		name = ritnmods.gedit.defines.styles.font.bold20,
		from = "default-bold",
		size = 20
	},


})