return {
  'folke/tokyonight.nvim',
  lazy = false, -- make sure to load during startup (only if it's your main colorscheme)
  priority = 1000, -- load this before all other plugins
  config = function()
    -- Load the colorscheme
    vim.cmd.colorscheme 'tokyonight'
  end,
}
