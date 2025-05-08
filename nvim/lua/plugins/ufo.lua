return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
        -- 折叠设置
        vim.o.foldcolumn = "1" -- 显示折叠指示器
        vim.o.foldlevel = 99 -- 默认展开所有折叠
        vim.o.foldlevelstart = 99 -- 启动时展开
        vim.o.foldenable = true -- 启用折叠

        -- 配置 nvim-ufo
        require('ufo').setup({
            provider_selector = function(bufnr, filetype, buftype)
                return { 'lsp', 'indent' } -- 优先使用 LSP（clangd），后备缩进
            end,
            fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local suffix = (' 󰁂 %d '):format(endLnum - lnum)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, {chunkText, hlGroup})
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    -- str width returned from truncate() may less than 2nd argument, need padding
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end
            table.insert(newVirtText, {suffix, 'MoreMsg'})
            return newVirtText
            end,
        })

        vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
        vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
        vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith)


        -- 折叠开关函数
        local function toggle_fold()
            local foldclosed = vim.fn.foldclosed(vim.fn.line('.'))
            if foldclosed == -1 then
                vim.cmd('normal! zc')
            else
                vim.cmd('normal! zo')
            end
        end

        -- 绑定空格键
        vim.keymap.set('n', '<Space>', toggle_fold)
        

    end,
}
