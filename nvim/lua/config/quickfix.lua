local M = {}

-- Quickfix 循环
function M.cnext_wrap()
    local qf_list = vim.fn.getqflist()
    if #qf_list == 0 then
        print("Quickfix list is empty")
        return
    end
    local current = vim.fn.getqflist({ idx = 0 }).idx
    if current >= #qf_list then
        vim.cmd("cfirst")
    else
        vim.cmd("cnext")
    end
end

function M.cprevious_wrap()
    local qf_list = vim.fn.getqflist()
    if #qf_list == 0 then
        print("Quickfix list is empty")
        return
    end
    local current = vim.fn.getqflist({ idx = 0 }).idx
    if current <= 1 then
        vim.cmd("clast")
    else
        vim.cmd("cprevious")
    end
end

-- Location 列表循环（可选）
function M.lnext_wrap()
    local loc_list = vim.fn.getloclist(0)
    if #loc_list == 0 then
        print("Location list is empty")
        return
    end
    local current = vim.fn.getloclist(0, { idx = 0 }).idx
    if current >= #loc_list then
        vim.cmd("lfirst")
    else
        vim.cmd("lnext")
    end
end

function M.lprevious_wrap()
    local loc_list = vim.fn.getloclist(0)
    if #loc_list == 0 then
        print("Location list is empty")
        return
    end
    local current = vim.fn.getloclist(0, { idx = 0 }).idx
    if current <= 1 then
        vim.cmd("llast")
    else
        vim.cmd("lprevious")
    end
end

return M
