return {
  -- Use `opts = {}` to force a plugin to be loaded.
  -- Everything in opts will be passed to setup()
  --
  --  This is equivalent to:
  --    require('everblush').setup({})
  'Everblush/nvim',
  name = 'everblush',
  priority = 1000,
  lazy = false,
  opts = {},
  config = function()
  vim.cmd('colorscheme everblush')
  end
}
-- vim: ts=2 sts=2 sw=2 et
