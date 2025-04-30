return 
{
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
        -- 禁用所有诊断显示
        vim.diagnostic.config({
            virtual_text = false,
            signs = false,
            underline = false,
            float = false,
            update_in_insert = false,
        })
    end,
}
