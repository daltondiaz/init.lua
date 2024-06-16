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

-- custom picker
local actions = require("telescope.actions")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local previewers = require "telescope.previewers"
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fr', builtin.git_branches, {})
vim.keymap.set('n', '<leader>fd', builtin.git_branches, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>bb', function()
    local cmd = {
        "git",
        "for-each-ref",
        "--sort=-committerdate",
        "--format=%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))",
        "refs/heads"
    }
    local finder = finders.new_oneshot_job(cmd, {
        entry_maker = conf.git_branch_entry_marker
    })
    pickers.new({}, {
        prompt_title = "Git Branches (by last commit)",
        finder = finder,
        previewer = previewers.git_branch_log.new({}),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(_, map)
            -- Use default mappings
            map("i", "<CR>", actions.git_checkout)
            map("n", "<CR>", actions.git_checkout)
            return true
        end
    }):find()
end)

vim.keymap.set('n', '<C-g>', builtin.git_status, {})
vim.keymap.set('n', '<C-l>', builtin.git_commits, {})
vim.keymap.set('n', '<C-s>', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fw', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
