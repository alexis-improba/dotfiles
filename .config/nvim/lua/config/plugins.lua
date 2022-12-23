return {

    { 'nvim-lua/plenary.nvim', lazy = true },

    { 'lewis6991/gitsigns.nvim', event = 'BufReadPre' },
    { 'lukas-reineke/indent-blankline.nvim', event = 'BufReadPre' },

    { 'folke/which-key.nvim', lazy = true },

    -- UI
    { 'stevearc/dressing.nvim', event = 'VeryLazy' },
    { 'nvim-lualine/lualine.nvim', event = 'VeryLazy' },
    {
        'folke/trouble.nvim',
        cmd = 'TroubleToggle',
        config = function() require 'config.plugins.trouble' end
    },

    {
        -- Code completion
        'hrsh7th/nvim-cmp',

        dependencies = {
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',

            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        }
    },

    {
        -- Language servers
        'neovim/nvim-lspconfig',

        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            'j-hui/fidget.nvim'
        }
    },

    { 'jose-elias-alvarez/null-ls.nvim' },

    {
        -- Debugger
        'mfussenegger/nvim-dap',

        dependencies = {
            'rcarriga/nvim-dap-ui',
            'jay-babu/mason-nvim-dap.nvim',
        }
    },

    {
        -- Quick navigation
        'ggandor/leap.nvim',
        event = 'VeryLazy',

        dependencies = {
            'ggandor/flit.nvim',
            { 'alexis/leap-spooky', dev = true }
        }
    },

    {
        -- Fuzzy finder
        'nvim-telescope/telescope.nvim',

        dependencies = {
            'debugloop/telescope-undo.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make', cond = vim.fn.executable 'make' == 1
            },
        }
    },

    {
        -- Language parser
        'nvim-treesitter/nvim-treesitter',
        build = vim.cmd.TSUpdateSync,

        dependencies = {
            { 'nvim-treesitter/nvim-treesitter-textobjects' },
            { 'nvim-treesitter/playground' },
        }
    },

    {
        -- Colorscheme
        'shaunsingh/nord.nvim',

        config = function()
            vim.cmd.colorscheme('nord')
        end
    },

    -- Editing stuff
    'kylechui/nvim-surround',

    { 'windwp/nvim-autopairs', config = function()
        require('nvim-autopairs').setup()
    end },

    { 'numToStr/Comment.nvim', config = function()
        require('Comment').setup()
    end },

}
