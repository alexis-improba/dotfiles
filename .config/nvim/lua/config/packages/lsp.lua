-- {{{ mason.nvim
local mason = require('mason')
local mason_config = require('mason-lspconfig')

-- Servers to install on start-up
local servers = {
    'pyright', 'sumneko_lua',
    'tsserver', 'volar', 'emmet_ls',
}

-- Changing mason's UI
mason.setup {
    ui = {
        icons = {
            package_installed = "*",
            package_pending = "~",
            package_uninstalled = "-"
        }
    }
}

mason_config.setup {
    -- Automatically install the servers mentioned below
    ensure_installed = servers
}
-- }}}

-- {{{ null-ls.nvim
local null_ls = require("null-ls")

-- Sources to register
local sources = {
    null_ls.builtins.formatting.autopep8,

    null_ls.builtins.formatting.prettier.with {
        extra_args = { "--no-config", "--tab-width", "4" }
    },
}

null_ls.setup { sources = sources }
-- }}}

-- {{{ nvim-lspconfig

local lsp = require('lspconfig')
local telescope_builtin = require('telescope.builtin')

-- Default function to run when attaching a client its LSP server
local on_attach = function(_, bufnr)
    -- Default options
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- Display information about hovered object
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    -- Don't map 'gc' or 'gb' because they are used by Comment.nvim
    -- Goto direct [d]efinitions, t[Y]pe definitions, [i]mplementations
    vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions, opts)
    vim.keymap.set("n", "gy", telescope_builtin.lsp_type_definitions, opts)
    vim.keymap.set("n", "gi", telescope_builtin.lsp_implementations, opts)

    -- Goto [r]eferences, [s]ymbols in the buffer, [S]ymbols in the workspace
    vim.keymap.set("n", "gr", telescope_builtin.lsp_references, opts)
    vim.keymap.set("n", "gs", telescope_builtin.lsp_document_symbols, opts)
    vim.keymap.set("n", "gS", telescope_builtin.lsp_workspace_symbols, opts)

    -- Rename symbol and Code actions
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>qq", vim.diagnostic.setqflist, opts)

    -- Navigate between diagnostics
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

    -- Formatting and diagnostic list
    vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format or vim.lsp.buf.formatting, opts)
    vim.keymap.set("n", "<leader>ed", telescope_builtin.diagnostics, opts)

    -- [re]start neovim LSP client
    vim.keymap.set("n", '<leader>re', '<cmd>LspRestart<cr>')
end

-- Capabilities from nvim-cmp
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').update_capabilities(client_capabilities)

-- Configuring all servers
for _, server in ipairs(servers) do
    lsp[server].setup({
        -- Execute this when attaching a LSP server to the current buffer
        on_attach = on_attach,

        -- Inform servers about the capabilities. See nvim-cmp
        capabilities = capabilities,

        settings = {
            -- Settings only applied to lua filetype
            Lua = {
                -- Inject `vim` as a global for diagnostics
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
    })
end
-- }}}