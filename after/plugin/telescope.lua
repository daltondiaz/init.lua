require('telescope').setup({
    defaults = {
        layout_strategy = 'vertical',
        layout_config = {
            vertical = { width = 0.5 }
        }
    }
})

require('telescope').load_extension('fzf')
-- require("telescope").load_extension('harpoon')

local builtin = require('telescope.builtin')
-- local extension = require('telescope.extension')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fr', builtin.git_branches, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- vim.keymap.set('n', '<leader><leader>b', ":Git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'", {})
vim.keymap.set('n', '<C-g>', builtin.git_status, {})
vim.keymap.set('n', '<C-l>', builtin.git_commits, {})
vim.keymap.set('n', '<C-s>', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fw', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
