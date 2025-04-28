return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            defaults = {
                cache_history = true,
                mappings = {
                    i = { -- 插入模式映射
                    ["<C-v>"] = function()
                        vim.api.nvim_put({ vim.fn.getreg("+") }, "c", true, true)
                    end,
                },
                n = { -- 普通模式映射
                ["<C-v>"] = false, -- 清除默认 Ctrl+v 映射
            },
        },
    },
})
    end,
}
