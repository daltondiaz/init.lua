local harpoon = require("harpoon")

harpoon:setup({
    settings = {
        save_on_toggle = true
    }
})

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>",function() harpoon.ui:toggle_quick_menu(harpoon:list())end)

vim.keymap.set("n", "<C-r>", function ()harpoon:list():remove()end)

-- I do that because my kinesis querty, btw my leader key is space 
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>9", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>0", function() harpoon:list():select(5) end)

-- vim.keymap.set("n", "<leader>5", function() harpoon:list():replace(1) end)

-- vim.keymap.set("n", "<leader>t", function() tmux.gotoTerminal(2) end)

