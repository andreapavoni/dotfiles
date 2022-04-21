
--[[
	Setup script for the vscode lsp server
--]]

local lspconfig = require('lspconfig')
local on_attach = require('config.lsp.setup').on_attach

local base_path = vim.fn.stdpath('data') .. '/lsp_servers/vscode-eslint/node_modules/vscode-langservers-extracted/bin/'
local eslint_path = base_path .. 'vscode-eslint-language-server'

lspconfig.eslint.setup{
	on_attach = on_attach,
	cmd = { eslint_path, "--stdio" },
}
