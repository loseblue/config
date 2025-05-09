return {
    {
        "smoka7/hop.nvim",
        config = function()
            local hop = require("hop")
            hop.setup({
                keys = "asdfghjklqertnopzxcvbm", -- 自定义标记字符
                jump_on_sole_occurrence = true, -- 单一目标直接跳转
                case_insensitive = true, 
            })
        end,
    },
}
