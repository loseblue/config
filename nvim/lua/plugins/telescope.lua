return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
            defaults = {
                cache_history = true,
                layout_config = {
                    horizontal = {
                        preview_width = 0.6,  -- 预览窗口占 60% 宽度
                        results_width = 0.4,  -- 结果窗口占 40% 宽度
                        width = 0.9,          -- 整个窗口占 90% 屏幕宽度
                        height = 0.8,         -- 整个窗口占 80% 屏幕高度
                    },
                },
                path_display = { "smart" },
                mappings = {
                    i = { ["<C-v>"] = function() vim.api.nvim_put({ vim.fn.getreg("+") }, "c", true, true) end, },
                    n = { ["<C-v>"] = false, },
                },
                pickers = {
                    live_grep = {
                        mappings = {
                            i = { ["<CR>"] = actions.smart_send_to_qflist + actions.close, },
                            n = { ["<CR>"] = actions.smart_send_to_qflist + actions.close, },
                        },
                        cache_picker = {
                            num_pickers = 2, -- 缓存最近 5 次 live_grep
                            limit_entries = 100, -- 每 picker 缓存 1000 条
                        },
                    },
                    grep_string = {
                        mappings = {
                            i = { ["<CR>"] = actions.smart_send_to_qflist + actions.close, },
                            n = { ["<CR>"] = actions.smart_send_to_qflist + actions.close, },
                        },
                        cache_picker = {
                            num_pickers = 2, -- 缓存最近 5 次 grep_string
                            limit_entries = 100,
                        },
                    },
                    -- 其他 picker 不缓存
                    find_files = {
                        cache_picker = false,
			find_command = { "fd", "--extension", "c", "--extension", "h" },
                    },
                    buffers = {
                        cache_picker = false,
                    },
                },
            },
        })
    end,
}
