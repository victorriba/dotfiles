local wezterm = require("wezterm")
local config = {
	window_padding = {
		left = 0,
		right = 0,
		top = 1,
		bottom = 0,
	},
	enable_scroll_bar = true,
	window_decorations = "RESIZE",
	font = wezterm.font("MesloLGS Nerd Font Mono"),
	font_size = 16.0,
	tab_max_width = 22,
	audible_bell = "Disabled",
	window_close_confirmation = "NeverPrompt",
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = false,
	window_background_opacity = 0.95,
	macos_window_background_blur = 10,
}
config.color_scheme = "Gruvbox dark, soft (base16)"
config.keys = {}
for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL|ALT",
		action = wezterm.action.MoveTab(i - 1),
	})
end

return config
