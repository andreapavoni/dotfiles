require('packer').startup({
	function(use)
		-- packer self management
		use('wbthomason/packer.nvim')

		-- {{{ lsp/autocompletion/snippets
		-- lsp plugins
		use('neovim/nvim-lspconfig')
		use('onsails/lspkind-nvim')
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer

		-- autocompletion
		use({
			'hrsh7th/nvim-cmp',
			requires = {
				{ 'hrsh7th/cmp-nvim-lsp' },
				{ 'hrsh7th/cmp-path' },
				{ 'hrsh7th/cmp-buffer' },
			},
		})
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/vim-vsnip")

		-- {{{ utility plugins
		-- these plugins are all realted to editor configs
		use({ 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } })
		use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
		 -- FZF
		 use {'junegunn/fzf', run = './install --bin'}
		 use { 'ibhagwan/fzf-lua', requires = { 'kyazdani42/nvim-web-devicons' } }

		use({"nvim-neo-tree/neo-tree.nvim", branch = "v2.x", requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim" 
    }, config = require('config.plug.neotree').config()})
		use('windwp/nvim-autopairs')
		use('terrortylor/nvim-comment')
		use('sbdchd/neoformat')
		use({ 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } })
		-- }}}

		-- {{{ imporved syntax plugins
		-- these add in a bit more bling and flair to nvim
		use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
		use('norcalli/nvim-colorizer.lua')
		-- }}}

		-- {{{ themes
		-- popular themes incoming
		use('joshdick/onedark.vim')
		use('sickill/vim-monokai')
		use('morhetz/gruvbox')
		use('shaunsingh/nord.nvim')
		use('sainnhe/gruvbox-material')

		-- neesh themes
		use('sainnhe/everforest')
		use('relastle/bluewery.vim')
		use('haishanh/night-owl.vim')
		-- }}}

		-- sessions
		use {'rmagatti/auto-session', config = function() require('auto-session').setup {} end}
	
	end,
	-- display packer dialouge in the center in a floating window
	config = {
		display = {
			open_fn = require('packer.util').float,
		},
	},
})

-- # vim foldmethod=marker
