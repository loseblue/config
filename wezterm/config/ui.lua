-- path:.config/wezterm/config/ui.lua
local wezterm = require("wezterm")

local fonts = { "Sarasa Term SC Nerd", "Fira Code", "Source Code Pro", "JetBrains Mono NL" }

return {
    animation_fps = 60,
    max_fps = 120,
    front_end = "WebGpu",
    font = wezterm.font("Sarasa Term SC Nerd", {italic = false }), -- 字体
    font_size = 12,
    webgpu_power_preference = "HighPerformance",
    webgpu_preferred_adapter = wezterm.gui.enumerate_gpus()[1],
    color_scheme = 'Gruvbox Dark (Gogh)',
    hide_tab_bar_if_only_one_tab = false,
    -- scrollbar
    enable_scroll_bar = false, -- 是否显示滚动条
    -- tab bar
    enable_tab_bar = false, -- 是否显示标签
    use_fancy_tab_bar = true,
    tab_max_width = 25,
    show_tab_index_in_tab_bar = true, -- 是否显示tab标签数
    switch_to_last_active_tab_when_closing_tab = true,
    -- window
    initial_cols = 120, -- 默认打开宽高
    initial_rows = 30,
    line_height = 1.06, -- 默认上下间距
    window_padding = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 7,
    },
    window_close_confirmation = "NeverPrompt",
    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.65,
    },
    window_decorations = "NONE",
    force_reverse_video_cursor = true
}
