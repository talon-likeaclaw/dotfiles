local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end
-- Settings
config.color_scheme = "Catppuccin Mocha"
config.window_decorations = "NONE"
config.window_background_opacity = 0.94
config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono Nerd Font", scale = 1.3 },
})
config.window_close_confirmation = "NeverPrompt"
config.scrollback_lines = 3000
config.use_fancy_tab_bar = false
config.audible_bell = "Disabled"
config.window_padding = {
	left = 25,
	right = 25,
	top = 25,
	bottom = 25,
}

-- Keys
config.leader = { key = "w", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "t", mods = "LEADER", action = act.SpawnTab("DefaultDomain") },
	{ key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
	{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "LeftArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "RightArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
	{ key = "DownArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	{ key = "UpArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
}

wezterm.on("gui-startup", function(window)
	local tab, pane, window = mux.spawn_window(cmd or {})
	local gui_window = window:gui_window()
	gui_window:set_position(0, 0)
	gui_window:maximize()
end)

-- and finally, return the configuration to wezterm
return config
