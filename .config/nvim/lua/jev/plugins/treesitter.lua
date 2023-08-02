local plugin = {
    -- Language parser
    'nvim-treesitter/nvim-treesitter',
    build = vim.cmd.TSUpdate,

    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    }
}

plugin.config = function()
    require('nvim-treesitter.configs').setup {
        auto_install = true,
        sync_install = false,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },

        indent = {
            enable = true,
            disable = { "python", "ts" },
        },

        textobjects = {
            select = {
                enable = true,
                lookahead = true,

                keymaps = {
                    ["af"] = { query = '@function.outer', desc = 'a function' },
                    ["if"] = { query = '@function.inner', desc = 'inner function' },

                    ["aP"] = { query = '@parameter.outer', desc = 'a parameter' },
                    ["iP"] = { query = '@parameter.inner', desc = 'inner parameter' },

                    ["ac"] = { query = "@class.outer", desc = "a class" },
                    ["ic"] = { query = "@class.inner", desc = "inner class" },

                    ["aa"] = { query = "@attribute.outer", desc = "an attribute" },
                    ["ia"] = { query = "@attribute.inner", desc = "inner attribute" },
                },
            },

            swap = {
                enable = true,

                swap_next = {
                    ["<Leader>lsp"] = { query = '@parameter.inner', desc = 'Swap next parameter' },
                },
                swap_previous = {
                    ["<Leader>lsP"] = { query = '@parameter.inner', desc = 'Swap previous parameter' },
                },
            },

            move = {
                enable = true,
                set_jumps = true,

                goto_next_start = {
                    ["]f"] = "@function.outer",
                    ["]p"] = { query = '@parameter.inner', desc = 'Next parameter start' },
                },
                goto_next_end = {
                    ["]F"] = "@function.outer",
                    ["]P"] = { query = '@parameter.inner', desc = 'Next parameter end' },
                },
                goto_previous_start = {
                    ["[f"] = "@function.outer",
                    ["[p"] = { query = '@parameter.inner', desc = 'Previous parameter start' },
                },

                goto_previous_end = {
                    ["[F"] = "@function.outer",
                    ["[P"] = { query = '@parameter.inner', desc = 'Previous parameter end' },
                },
            },
        }
    }
end

return plugin
