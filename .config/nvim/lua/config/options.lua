-- Use 24-bit colors
vim.opt.termguicolors = true

-- Never display sig,s
vim.opt.signcolumn = 'number'
vim.opt.cursorline = true

-- Enable mouse support in all modes
vim.opt.mouse = 'a'

-- Add line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Always use system clipboard
vim.opt.clipboard:append('unnamedplus')

-- Split panes below and to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Prefere a general persistent undo history
-- over the use of local swap files
vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.path = { '.', '**' }

-- Never display the statusline
vim.opt.laststatus = 0
vim.opt.ruler = false

-- Never display tabline
vim.opt.showtabline = 0

-- Just so that it is beautiful
vim.opt.scrolloff = 5
vim.opt.linebreak = true

-- Folds
vim.opt.foldmethod = 'marker'
vim.opt.foldnestmax = 1

-- Tabulation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Search
vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.shortmess = 'filnxtToOFIc'
vim.opt.diffopt:append({ 'algorithm:patience', 'iwhiteall', 'context:0' })

vim.opt.fillchars = { fold = ' ', eob = ' ' }
vim.opt.listchars = { eol = '¬', tab = '> ', trail = '-', extends = '!', precedes = '!' }

-- Don't show commands below the statusline
vim.opt.showcmd = false

-- Show which-key menu faster
vim.opt.timeoutlen = 500
vim.opt.updatetime = 200

-- Treat - as part of a word
vim.opt.iskeyword:append({ '-' })

-- Nord options
vim.g.nord_italic = false
vim.g.nord_borders = true
vim.g.nord_contrast = true

vim.cmd.colorscheme 'nord'

vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'
vim.cmd 'hi! link ModeMsg String'

vim.cmd 'hi! link DiffAdd String'
vim.cmd 'hi! link DiffDelete Debug'
vim.cmd 'hi! link DiffChange SpecialChar'
vim.cmd 'hi! link DiffText Number'