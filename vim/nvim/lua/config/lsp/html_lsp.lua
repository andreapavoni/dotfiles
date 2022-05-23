--[[ Setup script for the html lsp server
--]]

local lspconfig = require('lspconfig')
local on_attach = require('config.lsp.setup').on_attach

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local html_path = vim.fn.stdpath('data') .. 'lsp_servers/html/node_modules/vscode-langservers-extracted/bin/vscode-html-language-server'

lspconfig.html.setup{
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { html_path, "--stdio" },
}
