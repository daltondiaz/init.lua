-- Thi file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use('folke/tokyonight.nvim')
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('nvim-treesitter/nvim-treesitter-context')
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    -- LSP Support
    use { 'neovim/nvim-lspconfig' }
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }

    -- Autocompletion
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-nvim-lua' }

    -- Snippets
    use { 'L3MON4D3/LuaSnip' }
    use { 'rafamadriz/friendly-snippets' }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'folke/neodev.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    --  use 'github/copilot.vim'

    use 'jose-elias-alvarez/null-ls.nvim'

    use 'mfussenegger/nvim-jdtls'
    use 'mhinz/vim-signify'
    -- Php libs
    use 'nelsyeung/twig.vim'
    -- use('vbe0201/vimdiscord')
    use { "nvim-neotest/nvim-nio" }
    use {
        'scottmckendry/cyberdream.nvim',
        lazy = false,
        priority = 1000
    }
    use({
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
        end,
    })
    -- local plugin in dev progress
    --use '~/Dev/personal/commentable'
end)
