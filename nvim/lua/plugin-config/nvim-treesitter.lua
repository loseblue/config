require'nvim-treesitter.configs'.setup {
    -- 安装 language parser
    -- :TSInstallInfo 命令查看支持的语言
    ensure_installed = {"bash", "c", "cpp", "cmake", "markdown", "markdown_inline", "make", "yang", "python", "html", "css", "vim", "lua", "typescript", "tsx", "rust"},
    -- 启用代码高亮功能
    highlight = {
        enable = true,
        disable = { "html" },
        additional_vim_regex_highlighting = false
    },
    -- 启用增量选择
    incremental_selection = {
        enable = true,
    },
    -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
    indent = {
        enable = true
    }
}
-- 开启 Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
vim.wo.foldlevel = 99
