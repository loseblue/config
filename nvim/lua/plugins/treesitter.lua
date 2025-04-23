return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "markdown" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },  
            disable = { "java", "query" },
        })
    end
}


