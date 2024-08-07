return {
  'stevearc/conform.nvim',
  -- Use `opts = {}` to force a plugin to be loaded.
  -- Everything in opts will be passed to setup()
  --
  --  This is equivalent to:
  --    require('conform').setup({})
  opts = {
    format_on_save = {
      async = false,
      timeout_ms = 500,
      lsp_fallback = true,
    },
    -- Define your formatters
    formatters_by_ft = {
      html = { 'prettier' },
      css = { 'prettier' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      svelte = { 'prettier' },
      json = { 'fixjson' },
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
    },
    vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
      local conform = require 'conform'
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      }
    end, { desc = '[M]ake [P]retty - format file' }),
  },
}
