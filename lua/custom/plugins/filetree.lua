vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {}

    -- Neotree recommended keymaps
    vim.keymap.set('n', '<Leader>e', '<cmd>Neotree toggle current reveal_force_cwd<cr>', { desc = '[E]xpanded explore files in Neotree' })
    vim.keymap.set('n', '<Leader>b', '<cmd>Neotree toggle focus buffers right<CR>', { desc = 'Neotree show [B]uffers' })
    vim.keymap.set('n', '<Leader>gn', '<cmd>Neotree float git_status<CR>', { desc = '[G]it [N]eotreej' })
  end,
}
