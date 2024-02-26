-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = '[D]ocument [E]rrors in floating window' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- END OF ORIGINAL KICKSTART.NVIM

-- My additional keymaps
-- Press jj fast to escape (my addition)
vim.keymap.set({ 'i' }, 'jj', '<ESC>', { silent = true })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Neotree recommended keymaps
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle current reveal_force_cwd<cr>', { desc = '[E]xpanded explore files in Neotree' })
vim.keymap.set('n', '<leader>x', '<cmd>Neotree toggle focus filesystem<CR>', { desc = 'E[X]plore files in Neotree' })
vim.keymap.set('n', '<leader>b', '<cmd>Neotree toggle focus buffers right<CR>', { desc = 'Neotree show [B]uffers' })
vim.keymap.set('n', '<leader>gn', '<cmd>Neotree float git_status<CR>', { desc = '[G]it [N]eotreej' })

-- Move lines up and down in Visual mode (ThePrimeagen video)
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line up in Visual mode' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line down in Visual mode' })

vim.keymap.set('n', '<leader>df', '[mzt', { desc = '[D]ocument move current [F]uncion to top of screen' })

-- Keep cursor in place when paging up and down
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Keep cursor in place when paging up and down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Keep cursor in place when paging up and down' })

-- "Yank" to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = '[Y]ank to system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = '[Y]ank to system clipboard' })

-- Stay out of ex mode, don't press `Q`
vim.keymap.set('n', 'Q', '<nop>', { desc = 'Stay out of ex mode' })

-- Replace word you're on
vim.keymap.set('n', '<leader>sw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[S]ubstite [W]ord' })

-- [[ Basic Autocommands ]]
--  See :help lua-guide-autocommands

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
