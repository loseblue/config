vim.g.mapleader = ","
vim.g.maplocalleader = ","


require("basic")
require("config.lazy")
require("config.quickfix")
require("keybindings")


vim.cmd.colorscheme "gruvbox"

if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    -- vim.g.neovide_fullscreen = true
    -- vim.g.neovide_remember_window_size = true
    vim.g.neovide_cursor_vfx_mode = "torpedo"
    vim.opt.guifont = { "Sarasa Term SC Nerd", ":h12" }
end

