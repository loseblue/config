return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function (_, opts)
        vim.opt.cmdheight = 0
        require('lualine').setup({
            options = {
                theme = "gruvbox",
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
            },
            extensions = {},
            sections = {
                lualine_a = {
                    {
                        "mode",
                        icons_enabled = true,
                    },
                },
                lualine_b = {
                    {
                        "filetype",
                        colored = true,
                        icon_only = true,
                    },
                    "filename",
                },
                lualine_c = {
                    "branch",
                    "diff",
                },
                lualine_x = {},

                lualine_y = {
                    "location",
                },

                lualine_z = {
                    "progress",
                },
            },
        })
    end
}
