return {
    {
        "loseblue/hop.nvim",
        config = function()
            local hop = require("hop")
            hop.setup({
                keys = "etovxqpdygfblzhckisuran", -- 自定义标记字符
                jump_on_sole_occurrence = true, -- 单一目标直接跳转
            })
        end,
    },
}
