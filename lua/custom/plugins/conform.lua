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
      timeout_ms = 1000,
      lsp_fallback = true,
    },
    -- Define your formatters
    formatters_by_ft = {
      elixir = { 'mix' },
      html = { 'prettier' },
      css = { 'prettier' },
      javascript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescript = { 'prettier' },
      typescriptreact = { 'prettier' },
      svelte = { 'prettier' },
      json = { 'prettier' },
      jsonc = { 'prettier' },
      lua = { 'stylua' },
      ocaml = { 'ocamlformat' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
    },
    vim.keymap.set({ 'n', 'v' }, '<leader>ff', function()
      local conform = require 'conform'
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      }
    end, { desc = '[F]ormat [F]ile - format file' }),
  },
}
