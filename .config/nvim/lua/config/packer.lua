require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use { 'folke/which-key.nvim', config = function() require('which-key').setup {
            window = {
                border = 'single',
            },
        }
    end }

    use 'lewis6991/impatient.nvim'
    use 'stevearc/dressing.nvim'

    use {
        {
            'ggandor/leap.nvim',
            config = function()
                require('leap').add_default_mappings()
            end
        },
        {
            '~/dev/nvim/leap-spooky.nvim',
            config = function()
                require('leap-spooky').setup()
            end
        }
    }

    -- Lsp
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    use { -- LSP and tools
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            'j-hui/fidget.nvim'
        }
    }

    use 'jose-elias-alvarez/null-ls.nvim'

    -- Debugger
    use {
        'mfussenegger/nvim-dap',
        'rcarriga/nvim-dap-ui',
        'mfussenegger/nvim-dap-python',
    }

    use { -- Completion
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
        }
    }

    use 'nvim-lualine/lualine.nvim'

    -- Telescope
    use 'nvim-telescope/telescope.nvim'

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'nvim-telescope/telescope-file-browser.nvim' }

    -- Editing stuff
    use 'kylechui/nvim-surround'
    use 'windwp/nvim-autopairs'

    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

    -- Themes
    use 'shaunsingh/nord.nvim'

    use { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }

    use { -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }

    use { 'nvim-treesitter/playground', after = 'nvim-treesitter' }
end)

-- Creating autocommand group for Packer
local group = vim.api.nvim_create_augroup('PackerUserGroup', { clear = true })

-- Automatically run :PackerCompile whenever this file is changed
vim.api.nvim_create_autocmd('BufWritePost', {
    group = group,
    command = 'source <afile> | PackerCompile',
    pattern = 'packer.lua'
})
