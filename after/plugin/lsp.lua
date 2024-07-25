local lsp = require('lsp-zero')
local cmp = require('cmp')
lsp.preset('recommended')

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'jdtls',
        'tsserver',
        'eslint',
        'rust_analyzer',
        'gopls',
        'lua_ls',
        'lemminx'
    },
  handlers = {
    lsp.default_setup,
    --[[lua_ls = function()
      local lua_opts = lsp.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,]]
  },
})

lsp.setup_servers({'tsserver', 'eslint'})
local cmp_action = lsp.cmp_action()
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({select = false}),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        --   ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        --  ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    })
})

vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)

lsp.set_preferences({
    sign_icons = {}
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufrn, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help() end, opts)
end)


lsp.setup()
vim.diagnostic.config {
    underline = true,
    virtual_text = {
        prefix = "",
        severity = nil,
        source = "if_many",
        format = nil,
    },
    signs = true,
    severity_sort = true,
    update_in_insert = false,
}

 require'lspconfig'.lua_ls.setup {
   on_init = function(client)
     local path = client.workspace_folders[1].name
     if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
       return
     end
 
     client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
       runtime = {
         -- Tell the language server which version of Lua you're using
         -- (most likely LuaJIT in the case of Neovim)
         version = 'LuaJIT'
       },
       -- Make the server aware of Neovim runtime files
       workspace = {
         checkThirdParty = false,
         library = {
           vim.env.VIMRUNTIME
           -- Depending on the usage, you might want to add additional paths here.
           -- "${3rd}/luv/library"
           -- "${3rd}/busted/library",
         }
         -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
         -- library = vim.api.nvim_get_runtime_file("", true)
       }
     })
   end,
   settings = {
     Lua = {}
   }
 }

