-- Setup nvim-cmp.
local cmp = require('cmp')
local keymap = require('keymap')

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end
	},
	mapping = keymap.cmp_mappings,
	sources = cmp.config.sources({
		{name = 'nvim_lsp', priority = 1},
		{name = "vsnip"},
	}, {
		{name = 'buffer'}, {name = 'path'}
	})
})
