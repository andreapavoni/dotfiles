--[[
	Setup script for the elixir lsp server elixirls
--]]


-- local fn = vim.fn
--[[
local configs = require('lspconfig.configs')
if not configs.golangcilsp then
  configs.golangcilsp = {
  default_config = {
    root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
    filetypes = { 'go' },
    init_options = {
      command = { 'golangci-lint', 'run', '--fast', '--out-format', 'json' },
    },
  },
}
end
--]]

local lspconfig = require('lspconfig')

lspconfig.golangci_lint_ls.setup{}
lspconfig.gopls.setup {}
