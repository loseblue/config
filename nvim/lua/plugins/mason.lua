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
                ensure_installed = { "pylsp", "clangd" }, -- 确保安装 pylsp 和 clangd
                automatic_installation = true,
            })

            -- 手动配置 LSP 服务器
            local lspconfig = require("lspconfig")

            -- 默认配置
            local default_config = {
                on_attach = function(client, bufnr)
                    -- 可选：添加按键映射或自动补全
                end,
                -- capabilities = require('cmp_nvim_lsp').default_capabilities(), -- 集成 nvim-cmp（如果使用）
            }

            -- 配置 pylsp
            lspconfig.pylsp.setup(vim.tbl_deep_extend("force", default_config, {}))

            -- 配置 clangd
            lspconfig.clangd.setup(vim.tbl_deep_extend("force", default_config, {
                cmd = { "clangd", "--background-index", "--clang-tidy" },
                filetypes = { "c", "cpp", "objc", "objcpp" },
                root_dir = lspconfig.util.root_pattern(
                "compile_commands.json",
                ".clangd",
                ".git"
                ),
            }))
        end,
    },
}

