return {
    "hedyhli/outline.nvim",
    config = function()

        require("outline").setup {
            -- Your setup opts here (leave empty to use defaults)
            outline_window = {
                position = 'left',
                show_cursorline = true,
                hide_cursor = true,
            },
            outline_items = {
                show_symbol_details = false,
            },
            symbol_folding = {
                autofold_depth = false,
            },
        }
    end,
}
