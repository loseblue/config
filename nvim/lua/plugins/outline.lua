return {
    "hedyhli/outline.nvim",
    config = function()

        require("outline").setup {
            -- Your setup opts here (leave empty to use defaults)
            outline_window = {
                position = 'left',
            }
        }
    end,
}
