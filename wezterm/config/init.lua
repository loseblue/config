-- path:.config/wezterm/config/init.lua
local wezterm = require("wezterm")

local Config = {}
Config.__index = Config

function Config:init()
    local config = setmetatable({ options = {} }, self)
    return config
end

function Config:append(new_options)
    for k, v in pairs(new_options) do
        if self.options[k] ~= nil then
            wezterm.log_warn("该配置项已设置")
            goto continue
        end
        self.options[k] = v
        ::continue::
    end
    return self
end

return Config
