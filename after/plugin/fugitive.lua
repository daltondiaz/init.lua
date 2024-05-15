vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "ga", "<cmd>diffget //2<CR>") -- left side ours
vim.keymap.set("n", "gl", "<cmd>diffget //3<CR>") -- right side theirs

-- inspired by https://github.com/ThePrimeagen/init.lua/blob/249f3b14cc517202c80c6babd0f9ec548351ec71/after/plugin/fugitive.lua
local Dalton_Fugitive = vim.api.nvim_create_augroup("Dalton_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = Dalton_Fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "<leader>ç", function()
            vim.cmd.Git('push')
        end, opts)

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
        vim.keymap.set("n", "<leader>pu", function ()
            vim.cmd.Git('pull')
        end, opts);
    end,
})
