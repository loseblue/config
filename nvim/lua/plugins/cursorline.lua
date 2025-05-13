return {
    "ya2s/nvim-cursorline",
    config = function()
        require('nvim-cursorline').setup {
            cursorline = {
                enable = true,
                timeout = 1000,
                number = false,
            },
            cursorword = {
                enable = true,
                min_length = 3,
                hl = {fg = '#fe8019', bg = '#665c54', underline = true},
            }
        }
    end,
}
