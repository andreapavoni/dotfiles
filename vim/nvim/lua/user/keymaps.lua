-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- disable K command (:help K)
keymap('n', 'K', '<Nop>', opt)

-- better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- resize with arrows
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- bubble single lines
keymap('n', '<C-Up>', 'ddkP', opt)
keymap('n', '<C-Down>', 'ddp', opt)
--  bubble multiple lines
keymap('v', '<C-Up>', 'xkP`[V`]', opt)
keymap('v', '<C-Down>', 'xp`[V`]', opt)

-- navigate buffers
keymap("n", "<S-Right>", ":bnext<CR>", opts)
keymap("n", "<S-Left>", ":bprevious<CR>", opts)

-- clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- close buffers
keymap("n", "<C-d>", "<cmd>Bdelete!<CR>", opts)

-- better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "\\", ":NvimTreeToggle<CR>", opts)

-- {{{ FZF
-- git is under 'g' except list files that is bound to leader-space
-- rg is under 'r' except grep project that is bound to leader-/
keymap('n', '<leader><leader>', ":FzfLua files<CR>", { noremap = true, silent = true })
keymap('n', '<leader>.', ":FzfLua oldfiles<CR>", { noremap = true, silent = true })
keymap('n', '<leader>./', ":FzfLua search_history<CR>", { noremap = true, silent = true })
keymap('n', '<leader>:', ":FzfLua resume<CR>", { noremap = true, silent = true })
keymap('n', '<leader>.?', ":FzfLua resume<CR>", { noremap = true, silent = true })
keymap('n', '<leader>ff', ":FzfLua buffers<CR>", { noremap = true, silent = true })
keymap('n', '<leader>k', ":FzfLua keymaps<CR>", { noremap = true, silent = true })
keymap('n', '<leader>,', ":FzfLua git_files<CR>", { noremap = true, silent = true })
-- Git
keymap('n', '<leader>g', ":FzfLua git_bcommits<CR>", { noremap = true, silent = true })
keymap('n', '<leader>gs', ":FzfLua git_status<CR>", { noremap = true, silent = true })
keymap('n', '<leader>gp', ":FzfLua git_commits<CR>", { noremap = true, silent = true })
keymap('n', '<leader>gb', ":FzfLua git_branches<CR>", { noremap = true, silent = true })
keymap('n', '<leader>gc', ":FzfLua changes<CR>", { noremap = true, silent = true })
-- FZF ripgrep
keymap('n', '<leader>f', ":FzfLua grep_curbuf<CR>", { noremap = true, silent = true })
keymap('n', '<leader>/', ":FzfLua live_grep<CR>", { noremap = true, silent = true })
keymap('n', '<C-f>', ":FzfLua grep_cword<CR>", { noremap = true, silent = true })
keymap('v', '<C-f>',":FzfLua grep_visual<CR>", { noremap = true, silent = true })
-- map('n', '<C-l>', ":FzfLua grep_last<CR>", { noremap = true, silent = true })

-- LSP Mappings
-- All lsp function are under 'a'
-- All lsp diagnostic are under 'd'
-- All trouble function are under 't'
keymap('n', '<Leader>a', ":FzfLua lsp_code_actions<CR>", {noremap = true, silent = true})
keymap('n', '<Leader>ad', ":FzfLua lsp_definitions<CR>", {noremap = true, silent = true})
keymap('n', '<Leader>aD', ":FzfLua lsp_declarations<CR>", {noremap = true, silent = true})
keymap('n', '<Leader>at', ":FzfLua lsp_typedefs<CR>", {noremap = true, silent = true})
keymap('n', '<Leader>ai', ":FzfLua lsp_implementations<CR>", {noremap = true, silent = true})
keymap('n', '<Leader>ar', ":FzfLua lsp_references<CR>", {noremap = true, silent = true})
keymap('n', '<Leader>as', ":FzfLua lsp_document_symbols<CR>", {noremap = true, silent = true})
keymap('n', '<Leader>aws', ":FzfLua lsp_workspace_symbols<CR>", {noremap = true, silent = true})
keymap('n', '<Leader>ae', ':lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true, silent = true})
keymap('n', '<Leader>aE', ':lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap = true, silent = true})
keymap('n', '<Leader>af', ':lua vim.lsp.buf.formatting_sync(nil, 5000)<CR>', {noremap = true, silent = true})
keymap('n', '<Leader>d', ":FzfLua lsp_document_diagnostics<CR>", {noremap = true, silent = true})
keymap('n', '<Leader>da', ":FzfLua lsp_workspace_diagnostics<CR>", {noremap = true, silent = true})
keymap("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", {noremap = true, silent = true})
keymap("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>", {noremap = true, silent = true})
keymap("n", "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", {noremap = true, silent = true})
-- }}}

-- Git
-- keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>cc", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>cc", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- Lsp
-- keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
keymap("n", "<Tab>", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
