--[[
	Setup script for the golang lsp server
--]]


local on_attach = require('config.lsp.setup').on_attach
local lspconfig = require('lspconfig')

lspconfig.golangci_lint_ls.setup{}
lspconfig.gopls.setup {on_attach = on_attach}
