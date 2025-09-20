local harpoon = require("harpoon")

harpoon:setup({
    settings = {
        save_on_toggle = true
    }
})

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-r>", function() harpoon:list():remove() end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)

-- vim.keymap.set("n", "<leader>5", function() harpoon:list():replace(1) end)

-- vim.keymap.set("n", "<leader>t", function() tmux.gotoTerminal(2) end)
