return {
  'vim-test/vim-test',
  config = function() -- This is the function that runs, AFTER loading
    vim.keymap.set('n', '<Leader>t', '<cmd>TestNearest -strategy=neovim<CR>', { desc = '[t]est nearest' })
    vim.keymap.set('n', '<Leader>T', '<cmd>TestFile -strategy=neovim<CR>', { desc = '[T]est file' })
  end,
}
