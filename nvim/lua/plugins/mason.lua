return {
    -- Mason.nvim 插件
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },
    -- Mason-lspconfig.nvim 插件
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "pylsp", "clangd" }, -- 添加 clangd
                automatic_installation = true,
            })
            -- 配置LSP
            local lspconfig = require("lspconfig")
            require("mason-lspconfig").setup_handlers({
                -- 默认处理函数
                function(server_name)
                    lspconfig[server_name].setup({})
                end,
                -- 自定义Lua语言服务器
                ["pylsp"] = function()
                    lspconfig.pylsp.setup({
                    })
                end,
                -- 自定义clangd配置
                ["clangd"] = function()
                    lspconfig.clangd.setup({
                        cmd = { "clangd", "--background-index", "--clang-tidy" },
                        filetypes = { "c", "cpp", "objc", "objcpp" },
                        root_dir = lspconfig.util.root_pattern(
                        "compile_commands.json",
                        ".clangd",
                        ".git"
                        ),
                    })
                end,
            })
        end,
    },
}
