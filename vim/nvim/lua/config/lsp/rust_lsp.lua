
--[[
	Setup script for the rust lsp server rust_analyzer
--]]


local fn = vim.fn

local rust_install_path = fn.stdpath('data') .. '/lsp_servers/rust/rust-analyzer'
local on_attach = require('config.lsp.setup').on_attach

require'lspconfig'.rust_analyzer.setup{
	on_attach = on_attach,
	cmd = { rust_install_path },
}
