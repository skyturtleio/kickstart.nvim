return {
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'dokwork/lualine-ex',
      'nvim-tree/nvim-web-devicons',
    },
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_y = {
          { 'ex.lsp.single', icons_enabled = true },
        },
      },
    },
  },
}
