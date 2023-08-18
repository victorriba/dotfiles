local wezterm = require("wezterm")
local config = {
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	window_decorations = "RESIZE",
	font_size = 16.0,
	audible_bell = "Disabled",
	window_close_confirmation = "NeverPrompt",
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
}
config.keys = {
	{
		key = "q",
		mods = "SUPER",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "%",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "UpArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		key = "t",
		mods = "SUPER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
}
config.color_scheme = "Tokyo Night"
function tab_title(tab_info)
	local title = tab_info.active_pane.current_working_dir
	title = string.match(title, "[^/]+$")
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab_title(tab)
	local id = tonumber(tab.tab_index) + 1
	return {
		{ Text = " " .. id .. " " .. title .. " " },
	}
end)
return config
