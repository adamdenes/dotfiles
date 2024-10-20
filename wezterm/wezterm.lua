-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the color scheme:
-- config.color_scheme = "tokyonight-night"
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 19

-- config.window_padding = {
-- 	left = "1cell",
-- 	right = "1cell",
-- 	top = "0.5cell",
-- 	bottom = "0.5cell",
-- }

config.enable_tab_bar = false

config.window_decorations = "RESIZE" -- TITLE | RESIZE
-- config.window_decorations = "TITLE | RESIZE" -- TITLE | RESIZE
config.window_background_opacity = 0.7
config.macos_window_background_blur = 10
--
-- my coolnight colorscheme:
config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

config.keys = {
	{
		key = "f",
		mods = "CTRL|CMD",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- and finally, return the configuration to wezterm
return config
