local home = os.getenv('HOME')
local jdtls = require('jdtls')

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = home .. '/Dev/java/workspace/' .. project_name
local root_markers = {'pom.xml','gradlew', 'mvnw', '.git', 'build.gradle'}
local root_dir = require('jdtls.setup').find_root(root_markers)

function nnoremap(rhs, lhs, bufopts, desc)
    bufopts.desc = desc
    vim.keymap.set("n", rhs, lhs, bufopts)
end

-- TODO use LSP remap from lsp.lua

local on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    nnoremap('gd', vim.lsp.buf.definition, bufopts, "Go to definition")
    nnoremap('gi', vim.lsp.buf.implementation, bufopts, "Go to implementation")
    nnoremap('K', vim.lsp.buf.hover, bufopts, "Show method")
    nnoremap('[d', vim.diagnostic.goto_next, bufopts, "Go to Next Diagnostic")
    nnoremap(']d', vim.diagnostic.goto_prev, bufopts, "Go to Next Diagnostic")
    nnoremap('<leader>at', vim.lsp.buf.code_action, bufopts, "Code Action")
    nnoremap('<leader>rn', vim.lsp.buf.rename, bufopts, "Rename")
    nnoremap('<leader>gr', vim.lsp.buf.references, bufopts, "Show References")
    nnoremap('<C-h>', vim.lsp.buf.signature_help, bufopts, "")
    -- Java extensions provided by jdtls
    nnoremap("<space>o", jdtls.organize_imports, bufopts, "Organize imports")
    nnoremap("<space>ev", jdtls.extract_variable, bufopts, "Extract variable")
    nnoremap("<space>ec", jdtls.extract_constant, bufopts, "Extract constant")
    vim.keymap.set('v', "<space>em", [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
    { noremap=true, silent=true, buffer=bufnr, desc = "Extract method" })
end

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
    on_attach = on_attach,
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {
        '/usr/lib/jvm/java-17-openjdk-amd64/bin/java', -- or '/path/to/java11_or_newer/bin/java'
        '-javaagent:/home/dalton/.config/nvim/dependencies/lombok/lombok.jar',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms4g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', vim.fn.glob('/home/dalton/.config/jdt-language-server/plugins/org.eclipse.equinox.launcher_*.jar'),
        '-configuration', '/home/dalton/.config/jdt-language-server/config_linux',
        '-data', workspace_dir
    },

    -- 
    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    root_dir = root_dir,

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
        java = {
            format = {
                settings = {
                    url = home .. "/.config/nvim/dependencies/eclipse-java-google-style.xml",
                    profile = "GoogleStyle",
                },
            },
            signatureHelp = { enabled = true },
        }
    },

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
        bundles = {}
    },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)

