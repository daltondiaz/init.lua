-- Clone in some folder: git clone https://github.com/xdebug/vscode-php-debug.git
-- cd vscode-php-debug
-- npm install && npm run build
local dap = require'dap'

dap.adapters.php = {
    type = 'executable',
    command = 'nodejs',
    args = {"/home/dalton/Dev/personal/vscode-php-debug/out/phpDebug.js"},
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for xdebug',
        port = '9000',
        log = true,
    },
}

vim.fn.sign_define('DapBreakpoint', { text = '🐞' })

vim.keymap.set('n', "<leader>b", function () require('dap').toggle_breakpoint() end)
vim.keymap.set('n', "<F5>", function () require('dap').continue() end)
vim.keymap.set('n', "<F10>", function () require('dap').step_over() end)
vim.keymap.set('n', "<F11>", function () require('dap').step_into() end)
vim.keymap.set('n', "<F12>", function () require('dap').step_out() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)

local dapui = require("dapui")
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  expand_lines = vim.fn.has("nvim-0.7"),
  layouts = {
    {
      elements = {
        "scopes",
      },
      size = 0.3,
      position = "right"
    },
    {
      elements = {
        "repl",
        "breakpoints"
      },
      size = 0.3,
      position = "bottom",
    },
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil,
  },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
