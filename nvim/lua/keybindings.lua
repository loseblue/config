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
map("n", "f,", "<C-O>", opt)
map("n", "f.", "<C-I>", opt)
-- map("n", "fn", ":lua vim.lsp.buf.rename<CR>", opt)
-- map("n", "fl", "<cmd>Outline<CR>", { desc = "outline.nvim Toggle Outline" })

local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', 'fg', builtin.grep_string, { desc = 'Telescope grep string' })
vim.keymap.set('n', '<F3>', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', 'fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', 'fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', 'fd', builtin.lsp_definitions, { desc = 'Telescope func def' })
vim.keymap.set('n', 'fr', builtin.lsp_references, { desc = 'Telescope func ref' })
vim.keymap.set('n', 'fc', builtin.lsp_incoming_calls, { desc = 'Telescope func call' })
-- vim.keymap.set('n', 'fo', builtin.lsp_outgoing_calls, { desc = 'Telescope func call' })
vim.keymap.set('n', 'ft', builtin.lsp_type_definitions, { desc = 'Telescope type def' })
vim.keymap.set('n', 'fi', builtin.lsp_implementations, { desc = 'Telescope type impl' })
vim.keymap.set('n', 'fa', builtin.lsp_workspace_symbols, { desc = 'Telescope all symb' })
vim.keymap.set('n', 'fl', builtin.treesitter, { desc = 'treesitter' })
map("n", "fm", ":Telescope bookmarks list<CR>", opt)


--highlighter
map("n", "<leader>m", ":lua require'mywords'.hl_toggle()<CR>", { desc = "mywords.nvim " })



