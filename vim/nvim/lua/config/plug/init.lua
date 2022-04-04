--[[
This init file loads all of the plugin configuration files
--]]

return {
	require('config.plug.cmp'),
	require('config.plug.lualine'),
	require('config.plug.lspkind'),
	require('config.plug.tabline'),
	require('config.plug.nvimtree'),
	require('config.plug.gitsigns'),
	require('config.plug.autopairs'),
	require('config.plug.telescope'),
	require('config.plug.nvimcomment'),
	require('config.plug.nvimcolorizer'),
	require('config.plug.treesitter'),
}

-- # vim foldmethod=marker
