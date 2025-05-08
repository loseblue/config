-- path:.config/wezterm/config/keys.lua
local wezterm = require("wezterm")
local platform = require("utils.platform")()
local act = wezterm.action

local mod = {}

if platform.is_mac then
    mod.SUPER = "SUPER"
    mod.SUPER_REV = "SUPER|CTRL"
elseif platform.is_win or platform.is_linux then
    mod.SUPER = "ALT" -- to not conflict with Windows key shortcuts
    mod.SUPER_REV = "ALT|CTRL"
end

local keys = {} -- 未配置

return {
    disable_default_key_bindings = false,
    leader = { key = "Space", mods = mod.SUPER_REV },
    keys = keys,
}
