-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- Map leader key
-- keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "
vim.g.mapleader = ',' -- Map leader key to comma
vim.g.maplocalleader = ','

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- Allow copy paste with macos
keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })


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

-- {{{ Telescope
-- git is under 'g' except list files that is bound to leader-space
-- rg is under 'r' except grep project that is bound to leader-/
--
-- Files
keymap('n', '<leader><leader>', ":Telescope find_files<CR>", { noremap = true, silent = true })
keymap('n', '<leader>k', ":Telescope keymaps<CR>", { noremap = true, silent = true })
keymap('n', '<leader><Space>', ":Telescope git_files<CR>", { noremap = true, silent = true })
-- Git
keymap('n', '<leader>g', ":Telescope git_bcommits<CR>", { noremap = true, silent = true })
keymap('n', '<leader>gs', ":Telescope git_status<CR>", { noremap = true, silent = true })
keymap('n', '<leader>gp', ":Telescope git_commits<CR>", { noremap = true, silent = true })
keymap('n', '<leader>gb', ":Telescope git_branches<CR>", { noremap = true, silent = true })
-- ripgrep
keymap('n', '<leader>f', ":Telescope grep_string<CR>", { noremap = true, silent = true })
keymap('n', '<leader>/', ":Telescope live_grep<CR>", { noremap = true, silent = true })
-- LSP Mappings
-- All lsp function are under 'a'
-- All lsp diagnostic are under 'd'
-- All trouble function are under 't'
keymap('n', '<Leader>a', ":lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
keymap('n', '<Leader>ad', ":Telescope lsp_definitions<CR>", { noremap = true, silent = true })
keymap('n', '<Leader>aD', ":Telescope lsp_declarations<CR>", { noremap = true, silent = true })
keymap('n', '<Leader>at', ":Telescope lsp_typedefs<CR>", { noremap = true, silent = true })
keymap('n', '<Leader>ai', ":Telescope lsp_implementations<CR>", { noremap = true, silent = true })
keymap('n', '<Leader>ar', ":Telescope lsp_references<CR>", { noremap = true, silent = true })
keymap('n', '<Leader>as', ":Telescope lsp_document_symbols<CR>", { noremap = true, silent = true })
keymap('n', '<Leader>aws', ":Telescope lsp_workspace_symbols<CR>", { noremap = true, silent = true })
keymap('n', '<Leader>ae', ':lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>aE', ':lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>af', ':lua vim.lsp.buf.formatting_sync(nil, 5000)<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>d', ":Telescope lsp_document_diagnostics<CR>", { noremap = true, silent = true })
keymap('n', '<Leader>da', ":Telescope lsp_workspace_diagnostics<CR>", { noremap = true, silent = true })
-- }}}

keymap("n", "<leader>tt", ":TroubleToggle<cr>", { noremap = true, silent = true })
keymap("n", "<leader>tw", ":TroubleToggle workspace_diagnostics<cr>", { noremap = true, silent = true })
keymap("n", "<leader>td", ":TroubleToggle document_diagnostics<cr>", { noremap = true, silent = true })
keymap("n", "<leader>tq", ":TroubleToggle quickfix<cr>", { noremap = true, silent = true })


-- Git
-- keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>cc", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>cc", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- Code formatting (Lsp)
keymap("n", "<Tab>", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- -- Colde folding
keymap("n", "<space>", "za<CR>", opts)
-- keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.fold_open()<CR>", opts)
-- keymap("n", "<leader>cg", "<cmd>lua vim.lsp.buf.fold_close()<CR>", opts)
-- keymap("n", "zR", '<cmd>lua require("ufo").openAllFolds()<CR>', opts)
-- keymap("n", "zM", '<cmd>lua require("ufo").closeAllFolds()<CR>', opts)

-- Search and replace (spectre)
keymap("n", "<leader>S", "<cmd>lua require('spectre').open()<CR>", opts)
-- search current word
keymap("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", opts)
keymap("v", "<leader>s", "<esc>lua require('spectre').open_visual()<CR>", opts)
-- search in current file
keymap("n", "<leader>sp", "viw:lua require('spectre').open_file_search()<CR>", opts)
