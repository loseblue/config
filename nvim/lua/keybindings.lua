vim.g.mapleader = ","
vim.g.maplocalleader = ","


-- 保存本地变量
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }


-- windows 分屏快捷键
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- H行首L行尾
map("n", "H", "^", opt)
map("n", "L", "$", opt)


map("n", "<A-j>", "<PageDown>", opt)
map("n", "<A-k>", "<PageUp>", opt)
map("n", "zz", "zt9k9j", opt)


map("n", "<F12>", ":Vista<CR>", opt)
map("n", "<C-F12>", ":NvimTreeToggle<CR>", opt)

-- Hop 
map("n", "<leader>j", ":HopLineStartAC<CR>", opt)
map("n", "<leader>k", ":HopLineStartBC<CR>", opt)
map("n", "<leader>w", ":HopWordAC<CR>", opt)
map("n", "<leader>b", ":HopWordBC<CR>", opt)



