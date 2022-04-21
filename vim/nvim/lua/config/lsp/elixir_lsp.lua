--[[
	Setup script for the elixir lsp server elixirls
--]]


local fn = vim.fn

local elixirls_install_path = fn.stdpath('data') .. '/lsp_servers/elixir/elixir-ls/language_server.sh'
local on_attach = require('config.lsp.setup').on_attach

require'lspconfig'.elixirls.setup{
	on_attach = on_attach,
	cmd = { elixirls_install_path },
}
