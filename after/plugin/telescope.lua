require('telescope').setup({
    defaults = {
        layout_strategy = 'horizontal'
    }
})

require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
-- local extension = require('telescope.extension')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fr', builtin.git_branches, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<C-g>', builtin.git_status, {})
vim.keymap.set('n', '<C-l>', builtin.git_commits, {})
vim.keymap.set('n', '<C-s>', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fw', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
