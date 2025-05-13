return {
    "nvimdev/lspsaga.nvim",
    event = "VeryLazy",
    config = function()
        require("lspsaga").setup({
            ui = {
                border = 'rounded',
                code_action_icon = '💡',
            },
            definition = {
                edit = '<C-c>o',
                vsplit = '<C-c>v',
                split = '<C-c>i',
                tabe = '<C-c>t',
                quit = 'q',
            },
            hover = {
                max_width = 80,
            },
        })
    end,
}
