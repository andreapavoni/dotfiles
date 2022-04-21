
--[[
	Setup script for the svelte lsp server
--]]


local svelte_install_path = vim.fn.stdpath('data') .. '/lsp_servers/svelte/node_modules/svelte-language-server/bin/server.js'

local lspconfig = require('lspconfig')
local on_attach = require('config.lsp.setup').on_attach

lspconfig.svelte.setup{
	on_attach = on_attach,
	cmd = { svelte_install_path, "--stdio" },
}
