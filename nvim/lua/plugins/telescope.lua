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
                        preview_width = 0.6,  -- Ԥ������ռ 60% ���
                        results_width = 0.4,  -- �������ռ 40% ���
                        width = 0.9,          -- ��������ռ 90% ��Ļ���
                        height = 0.8,         -- ��������ռ 80% ��Ļ�߶�
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
                            num_pickers = 2, -- ������� 5 �� live_grep
                            limit_entries = 100, -- ÿ picker ���� 1000 ��
                        },
                    },
                    grep_string = {
                        mappings = {
                            i = { ["<CR>"] = actions.smart_send_to_qflist + actions.close, },
                            n = { ["<CR>"] = actions.smart_send_to_qflist + actions.close, },
                        },
                        cache_picker = {
                            num_pickers = 2, -- ������� 5 �� grep_string
                            limit_entries = 100,
                        },
                    },
                    -- ���� picker ������
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
