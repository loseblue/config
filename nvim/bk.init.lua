require("basic")
require("plugins")
require("keybindings")
require("colorscheme")


-- 插件配置
require("plugin-config.lualine")
require("plugin-config.nvim-tree")
require("plugin-config.nvim-treesitter")

require("marks")




if executable('clipboard-provider')
    let g:clipboard = {
        \ 'name': 'myClipboard',
        \     'copy': {
            \         '+': 'clipboard-provider copy',
            \         '*': 'clipboard-provider copy',
            \     },
            \     'paste': {
                \         '+': 'clipboard-provider paste',
                \         '*': 'clipboard-provider paste',
                \     },
                \ }
                endif
