return {
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufWinEnter",
        config = {
            char_blankline = "│",
            use_treesitter = true,
            show_first_indent_level = false,
        },
    },

    -- {
    --     "udayvir-singh/tangerine.nvim",
    --     dependencies = "udayvir-singh/hibiscus.nvim",
    -- },

    {
        "tpope/vim-fugitive",
    },

    {
        "nvim-neorg/neorg",
        ft = "norg",
        cmd = "Neorg",
        build = ":Neorg sync-parsers",
        opts = {
            load = {
                ["core.defaults"] = {}
            }
        }
    },

    {
        -- Debugger
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "jay-babu/mason-nvim-dap.nvim",
        },
    },

    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        config = {
            input = {
                win_options = {
                    winblend = 0,
                },
            },
        },
    },

    -- Editing stuff
    {
        "kylechui/nvim-surround",
        keys = {
            "ys",
            "ds",
            "cs",
            { "S", mode = "v" },
        },
        config = true,
    },

    {
        "numToStr/Comment.nvim",
        keys = { { "gc", mode = "v" }, "gcc", "gbc" },
        config = true,
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
}
