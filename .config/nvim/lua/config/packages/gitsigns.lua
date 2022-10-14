-- Git signs in the signcolumn
local git_signs = require('gitsigns')

-- Only provide mappings inside of git repositories
local on_attach = function(_)
    -- Navigate between hunks
    vim.keymap.set('n', '[h', git_signs.prev_hunk, { desc = "Previous git hunk"})
    vim.keymap.set('n', ']h', git_signs.next_hunk, { desc = "Next git hunk"})

    -- Blame the current line(s)
    vim.keymap.set({ 'n', 'v' }, '<leader>gb', git_signs.toggle_current_line_blame, { desc = "Blame current line"})

    -- Stage / unstage hunks
    vim.keymap.set({ 'n', 'v' }, '<leader>gs', git_signs.stage_hunk, { desc = "Stage hunk" })
    vim.keymap.set({ 'n', 'v' }, '<leader>gu', git_signs.undo_stage_hunk, { desc = "Undo stage hunk" })

    -- Stage entire buffer
    vim.keymap.set('n', '<leader>gS', git_signs.stage_buffer, { desc = "Stage buffer" })

    -- Custom text-object for hunks
    vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "inner git hunk" })

    vim.opt_local.winbar = '%=%#Float#%{b:gitsigns_status} %#Type#%m %0*%t'
end

-- Global setup
git_signs.setup {

    -- Changing signs
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' }
    },

    -- Lower blame delay (default is 1000)
    current_line_blame_opts = {
        delay = 150,
    },

    -- Execute this function when attaching
    on_attach = on_attach

}
