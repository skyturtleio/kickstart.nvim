-- [[ Basic Keymaps ]]

-- Press jj fast to escape
vim.keymap.set({ 'i' }, 'jj', '<ESC>', { silent = true })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = '[D]ocument [E]rrors in floating window' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

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

-- vim: ts=2 sts=2 sw=2 et
