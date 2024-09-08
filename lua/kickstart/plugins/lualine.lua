local function get_attached_clients()
  -- Get active clients for current buffer
  local buf_clients = vim.lsp.get_clients { bufnr = 0 }
  if #buf_clients == 0 then
    return 'No client active'
  end
  local buf_ft = vim.bo.filetype
  local buf_client_names = {}
  local num_client_names = #buf_client_names

  -- Add lsp-clients active in the current buffer
  for _, client in pairs(buf_clients) do
    num_client_names = num_client_names + 1
    buf_client_names[num_client_names] = client.name
  end

  -- Add linters for the current filetype (nvim-lint)
  local lint_success, lint = pcall(require, 'lint')
  if lint_success then
    for ft, ft_linters in pairs(lint.linters_by_ft) do
      if ft == buf_ft then
        if type(ft_linters) == 'table' then
          for _, linter in pairs(ft_linters) do
            num_client_names = num_client_names + 1
            buf_client_names[num_client_names] = linter
          end
        else
          num_client_names = num_client_names + 1
          buf_client_names[num_client_names] = ft_linters
        end
      end
    end
  end

  -- Add formatters (conform.nvim)
  local conform_success, conform = pcall(require, 'conform')
  if conform_success then
    for _, formatter in pairs(conform.list_formatters_for_buffer(0)) do
      if formatter then
        num_client_names = num_client_names + 1
        buf_client_names[num_client_names] = formatter
      end
    end
  end

  local client_names_str = table.concat(buf_client_names, ', ')
  local language_servers = string.format('[%s]', client_names_str)

  return language_servers
end

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
        -- lualine_x = {
        --   get_attached_clients,
        -- },
        lualine_y = {
          { 'ex.lsp.single', icons_enabled = true },
        },
      },
    },
  },
}
