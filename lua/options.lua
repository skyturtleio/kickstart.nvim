-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Make line numbers default
vim.wo.number = true

-- Set relative line numbers
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
-- See :help 'list'
-- and :help 'listchars'
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- END OF ORIGINAL KICKSTART.NVIM

vim.opt.wrap = false
vim.opt.sidescroll = 10

-- I was having an issue with Bun.sh --watch mode failing
-- I don't know why this works. The GitHub issue where I found this is:
-- https://github.com/oven-sh/bun/issues/8520
vim.opt.backupcopy = 'yes'

-- Set completeopt to have a better completion experience
-- From modular version
-- vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
-- From modular version
-- vim.o.termguicolors = true

-- vim: ts=2 sts=2 sw=2 et
