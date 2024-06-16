-- this is a experimental lsp creation
local client = vim.lsp.start_client {
    name = "xmovalsp",
    cmd = { "/home/dalton/Dev/personal/xmovalsp/main"},
}

if not client then
    vim.notify "hey, you didnt do the client thing good"
    return
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "xmova",
    callback = function ()
        vim.lsp.buf_attach_client(0, client)
    end,
})
