return {
    "hedyhli/outline.nvim",
    config = function()

        require("outline").setup {
            -- Your setup opts here (leave empty to use defaults)
            outline_window = {
                position = 'left',
                show_cursorline = true,
                width = 18,
                relative_width = true,
            },
            outline_items = {
                show_symbol_details = true,
            },
            symbol_folding = {
                autofold_depth = false,
            },

            guides = {
                enabled = true,
                markers = {
                    bottom = '└',
                    middle = '├',
                    vertical = '│',
                },
            },
        }
    end,
}
