vim.g.mapleader = ","
vim.g.maplocalleader = ","


-- 保存本地变量
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

map("n", "<C-C>", '"+y', opt)
map("i", "<C-C>", '"+y', opt)
map("v", "<C-C>", '"+y', opt)
map("n", "<C-V>", '"+p', opt)
map("i", "<C-V>", '"+p', opt)
map("v", "<C-V>", '"+p', opt)


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


map("n", "<M-j>", "<PageDown>", opt)
map("n", "<M-k>", "<PageUp>", opt)
map("n", "zz", "zt6k6j", opt)


-- Hop 
map("n", "<leader>j", ":HopLineStartAC<CR>", opt)
map("n", "<leader>k", ":HopLineStartBC<CR>", opt)
map("n", "<leader>w", ":HopWordAC<CR>", opt)
map("n", "<leader>b", ":HopWordBC<CR>", opt)


--lsp
map("n", "fn", ":lua vim.lsp.buf.rename<CR>", opt)
map("n", "fd", ":lua vim.lsp.buf.definition()<CR>", opt)
map("n", "fi", ":lua vim.lsp.buf.implementation()<CR>", opt)
map("n", "fr", ":lua vim.lsp.buf.references()<CR>", opt)
map("n", "f,", "<C-O>", opt)
map("n", "f.", "<C-I>", opt)
map('n', 'ff',":Telescope find_files<CR>", { desc = 'Telescope find files' })
map('n', 'fg', ":Telescope live_grep<CR>", { desc = 'Telescope live grep' })
map('n', 'fb', ":Telescope buffers<CR>", { desc = 'Telescope buffers' })
map("n", "fl", "<cmd>Outline<CR>", { desc = "outline.nvim Toggle Outline" })


--highlighter
map("n", "<leader>m", ":lua require'mywords'.hl_toggle()<CR>", { desc = "mywords.nvim " })
