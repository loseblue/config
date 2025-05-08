return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            defaults = {
                cache_history = true,
                mappings = {
                    i = { 
                        ["<C-v>"] = function()
                            vim.api.nvim_put({ vim.fn.getreg("+") }, "c", true, true)
                        end,
                    },
                    n = { 
                        ["<C-v>"] = false, 
                    },
                },
                pickers = {
                    find_files = {
                        find_command = { "fd", "--extension", "c", "--extension", "h" },
                    },
                },
            },
        })
    end,
}
