-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
--  In general, I like to keep keymaps with the plugin they're related to, but there are execptions.
--  For example, Telescope keymaps are in `telescope-setup.lua`, but in this file, I have set up
--  some keymaps for Neotree.

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<Leader>de', vim.diagnostic.open_float, { desc = '[D]ocument [E]rrors in floating window' })
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

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

-- Move lines up and down in Visual mode (ThePrimeagen video)
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line up in Visual mode' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line down in Visual mode' })

vim.keymap.set('n', '<Leader>df', '[mzt', { desc = '[D]ocument move current [F]uncion to top of screen' })

-- Keep cursor in place when paging up and down
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Keep cursor in place when paging up and down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Keep cursor in place when paging up and down' })

-- "Yank" to system clipboard
vim.keymap.set({ 'n', 'v' }, '<Leader>y', [["+y]], { desc = '[Y]ank to system clipboard' })
vim.keymap.set('n', '<Leader>Y', [["+Y]], { desc = '[Y]ank to system clipboard' })

-- Stay out of ex mode, don't press `Q`
vim.keymap.set('n', 'Q', '<nop>', { desc = 'Stay out of ex mode' })

-- Replace word you're on
vim.keymap.set('n', '<Leader>sw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[S]ubstite [W]ord' })

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

-- Toggle diagnostics e.g. the virtual text that can get annoying on/off
vim.keymap.set('n', '<leader>td', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true })

-- vim: ts=2 sts=2 sw=2 et
