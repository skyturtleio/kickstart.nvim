return {
  'stevearc/conform.nvim',
  -- Use `opts = {}` to force a plugin to be loaded.
  -- Everything in opts will be passed to setup()
  --
  --  This is equivalent to:
  --    require('conform').setup({})
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    -- Define your formatters
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      -- javascript = { { "prettierd", "prettier" } },
    },
  },
}
