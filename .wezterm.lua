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
	tab_max_width = 32,
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

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CMD",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

wezterm.on("format-tab-title", function(tab)
	local title = tab.active_pane.title
	local path_parts = {}

	for part in string.gmatch(title, "[^/]+") do
		table.insert(path_parts, part)
	end

	local formatted_title = ""
	if #path_parts >= 2 then
		formatted_title = path_parts[#path_parts - 1] .. "/" .. path_parts[#path_parts]
	elseif #path_parts == 1 then
		formatted_title = path_parts[1]
	else
		formatted_title = title
	end

	local tab_number = tab.tab_index + 1

	local indicator = tab.is_active and "●" or "○"

	return string.format("  %s %d. %s  ", indicator, tab_number, formatted_title)
end)

return config
