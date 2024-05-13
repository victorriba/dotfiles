local wezterm = require("wezterm")
local mux = wezterm.mux
local config = {
        window_padding = {
                left = 0,
                right = 0,
                top = 0,
                bottom = 0,
        },
        window_decorations = "RESIZE",
        font_size = 16.0,
        tab_max_width = 22,
        audible_bell = "Disabled",
        window_close_confirmation = "NeverPrompt",
        use_fancy_tab_bar = false,
}
config.keys = {}
for i = 1, 8 do
        -- CTRL+ALT + number to move to that position
        table.insert(config.keys, {
                key = tostring(i),
                mods = "CTRL|ALT",
                action = wezterm.action.MoveTab(i - 1),
        })
end
function tab_title(tab_info)
        local title = tab_info.active_pane.title
        local pattern = "^.*%/([^%/]+)/([^%/]+)$"
        local previous, current = string.match(title, pattern)
        if current and previous then
                return previous .. "/" .. current
        else
                return tab_info.active_pane.foreground_process_name
        end
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
        local title = tab_title(tab)
        local id = tonumber(tab.tab_index) + 1
        return {
                { Text = " " .. id .. " " .. title .. " " },
        }
end)
wezterm.on("gui-startup", function()
        local tab, pane, window = mux.spawn_window({})
        window:gui_window():maximize()
end)
return config
