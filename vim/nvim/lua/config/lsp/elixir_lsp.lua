--[[
	Setup script for the elixir lsp server elixirls
--]]


local fn = vim.fn

local elixirls_install_path = fn.stdpath('data') .. '/lsp_servers/elixir/elixir-ls/language_server.sh'

require'lspconfig'.elixirls.setup{
	cmd = { elixirls_install_path };
}
