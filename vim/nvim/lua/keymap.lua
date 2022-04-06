-- {{{
local function map(mode, bind, exec, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, bind, exec, opts)
end

local function unmap(mode, bind)
	vim.api.nvim_del_keymap(mode, bind)
end

local opt = {} --empty opt for maps with no extra options
local M = {}
-- }}}

--[[
    MAPPING:
	map takes 4 args:
		The first is the type, whether in all, normal, insert etc. (reference: https://github.com/nanotee/nvim-lua-guide#defining-mappings)
		The Second Arg is the keybind. Just like normal vim way
		The Third is the command to execute
		The Fourth is other extra options

	Example:  (toggles line numbers)
		map("n", "<C-n>", ":set rnu!<CR>", opt)
--]]

-- {{{ Umapping
--unmap('n', '<leader>f')
-- }}}

-- {{{ misc bindings
vim.g.mapleader = ',' -- Map leader key to comma
vim.g.maplocalleader = ','
map('n', '<C-n>', ':nohlsearch<CR>', opt) -- toggle search highlighting
-- map('', '<C-c>', ':CommentToggle<CR>', opt) -- toggle comment on current line or selection
map('', '\\', ':Neotree toggle<CR>', opt) -- toggle neotree
-- map('n', '<leader>nf', ':Neoformat<CR>', { noremap = true }) -- format current buffer with neoformat
map('n', '<Tab>', ':Neoformat<CR>', { noremap = true }) -- format current buffer with neoformat

-- clipboard mappings
map('n', '<leader>ya', ':%y+<CR>', opt) -- Copy content of entire buffer to system clipboard
map('n', '<leader>yl', '"+yy', opt) -- yank current line into system clipboard

-- write buffer changes
map('n', 'WW', ":w<CR>", opt)
-- }}}

-- {{{ autocompletion mappings for cmp
local cmp = require('cmp')
M.cmp_mappings = {
	['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
	['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-d>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-e>'] = cmp.mapping.close(),
	['<CR>'] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Insert,
		select = true,
	}),
}
-- }}}

-- {{{ gitsigns mappings
M.gitsigns_mappings = {
-- 	noremap = true,
-- 	['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
-- 	['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },
-- 	['n <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
-- 	['v <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
-- 	['n <leader>gu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
-- 	['n <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
-- 	['v <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
-- 	['n <leader>gR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
-- 	['n <leader>gp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
-- 	['n <leader>gb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
-- 	['n <leader>gS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
-- 	['n <leader>gU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',
--
-- 	-- Text objects
-- 	['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
-- 	['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
}
-- }}}

-- {{{ buffer management
map('n', '<S-Left>', ':bp<CR>', { noremap = true })
map('n', '<S-Right>', ':bn<CR>', { noremap = true })
-- close NeoTree if open and delete current buffer
map('n', '<C-d>', ':Neotree close<CR> :bdelete<CR>', { noremap = true })
-- }}}


-- bubble single lines
map('n', '<C-Up>', 'ddkP', opt)
map('n', '<C-Down>', 'ddp', opt)
--  bubble multiple lines
map('v', '<C-Up>', 'xkP`[V`]', opt)
map('v', '<C-Down>', 'xp`[V`]', opt)

-- {{{ window navigation
map('n', '<C-h>', ':wincmd h<CR>', opt)
map('n', '<C-j>', ':wincmd j<CR>', opt)
map('n', '<C-k>', ':wincmd k<CR>', opt)
map('n', '<C-l>', ':wincmd l<CR>', opt)
-- }}}

-- disable K command (:help K)
map('n', 'K', '<Nop>', opt)

-- {{{ terminal commands
map('t', '<C-\\>', '<C-\\><C-n>', opt)
map('n', '<leader>\\', ':ToggleTerm dir=git_dir direction=horizontal<cr>', opt)
-- }}}

-- {{{ FZF
-- git is under 'g' except list files that is bound to leader-space
-- rg is under 'r' except grep project that is bound to leader-/
map('n', '<leader><leader>', ":FzfLua files<CR>", { noremap = true, silent = true })
map('n', '<leader>.', ":FzfLua oldfiles<CR>", { noremap = true, silent = true })
map('n', '<leader>./', ":FzfLua search_history<CR>", { noremap = true, silent = true })
-- map('n', '<leader>.:', ":FzfLua command_history<CR>", { noremap = true, silent = true })
map('n', '<leader>:', ":FzfLua resume<CR>", { noremap = true, silent = true })
map('n', '<leader>.?', ":FzfLua resume<CR>", { noremap = true, silent = true })
map('n', '<leader>ff', ":FzfLua buffers<CR>", { noremap = true, silent = true })
-- map('n', '<leader>m', ":FzfLua marks<CR>", { noremap = true, silent = true })
map('n', '<leader>k', ":FzfLua keymaps<CR>", { noremap = true, silent = true })
-- map('n', '<leader>r', ":FzfLua registers<CR>", { noremap = true, silent = true })
-- map('n', '<leader>j', ":FzfLua jump<CR>", { noremap = true, silent = true })
map('n', '<leader><Space>', ":FzfLua git_files<CR>", { noremap = true, silent = true })
-- Git
map('n', '<leader>g', ":FzfLua git_bcommits<CR>", { noremap = true, silent = true })
map('n', '<leader>gs', ":FzfLua git_status<CR>", { noremap = true, silent = true })
map('n', '<leader>gp', ":FzfLua git_commits<CR>", { noremap = true, silent = true })
map('n', '<leader>gb', ":FzfLua git_branches<CR>", { noremap = true, silent = true })
map('n', '<leader>gc', ":FzfLua changes<CR>", { noremap = true, silent = true })
-- FZF ripgrep
map('n', '<leader>f', ":FzfLua grep_curbuf<CR>", { noremap = true, silent = true })
map('n', '<leader>/', ":FzfLua live_grep<CR>", { noremap = true, silent = true })
map('n', '<C-f>', ":FzfLua grep_cword<CR>", { noremap = true, silent = true })
map('v', '<C-f>',":FzfLua grep_visual<CR>", { noremap = true, silent = true })
-- map('n', '<C-l>', ":FzfLua grep_last<CR>", { noremap = true, silent = true })

-- LSP Mappings
-- All lsp function are under 'a'
-- All lsp diagnostic are under 'd'
-- All trouble function are under 't'
map('n', '<Leader>a', ":FzfLua lsp_code_actions<CR>", {noremap = true, silent = true})
map('n', '<Leader>ad', ":FzfLua lsp_definitions<CR>", {noremap = true, silent = true})
map('n', '<Leader>aD', ":FzfLua lsp_declarations<CR>", {noremap = true, silent = true})
map('n', '<Leader>at', ":FzfLua lsp_typedefs<CR>", {noremap = true, silent = true})
map('n', '<Leader>ai', ":FzfLua lsp_implementations<CR>", {noremap = true, silent = true})
map('n', '<Leader>ar', ":FzfLua lsp_references<CR>", {noremap = true, silent = true})
map('n', '<Leader>as', ":FzfLua lsp_document_symbols<CR>", {noremap = true, silent = true})
map('n', '<Leader>aws', ":FzfLua lsp_workspace_symbols<CR>", {noremap = true, silent = true})
map('n', '<Leader>ae', ':lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true, silent = true})
map('n', '<Leader>aE', ':lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap = true, silent = true})
map('n', '<Leader>af', ':lua vim.lsp.buf.formatting_sync(nil, 5000)<CR>', {noremap = true, silent = true})
map('n', '<Leader>d', ":FzfLua lsp_document_diagnostics<CR>", {noremap = true, silent = true})
map('n', '<Leader>da', ":FzfLua lsp_workspace_diagnostics<CR>", {noremap = true, silent = true})
map("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", {noremap = true, silent = true})
map("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>", {noremap = true, silent = true})
map("n", "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", {noremap = true, silent = true})
-- }}}

-- returns any externally-required keymaps for usage
return M

-- # vim foldmethod=marker
