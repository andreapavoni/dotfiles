--[[
    autocmds.lua
    This file defines various useful autocmds
--]]

local cmd = vim.cmd

-- Don't show line numbers on terminal window
cmd([[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]])

-- For Go files, use real tabs, not tabs expanded to spaces
cmd([[ au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4 ]])
  
-- Remember last location in file, but not for commit messages.
-- see :help last-position-jump
cmd([[ au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g`\"" | endif ]])


-- setup '#' comment prefix for Elixir files
cmd([[
	" when you enter a (new) buffer
	augroup set-commentstring-ag
		autocmd!
		autocmd BufEnter *.ex,*.exs :lua vim.api.nvim_buf_set_option(0, "commentstring", "# %s")
		" when you've changed the name of a file opened in a buffer, the file type may have changed
		autocmd BufFilePost *.ex,*.exs :lua vim.api.nvim_buf_set_option(0, "commentstring", "# %s")
	augroup END
]])

--local lspGrp = api.nvim_create_augroup("BufWritePre", { clear = true })
--api.nvim_create_autocmd("BufWritePre", {
--  pattern = "*",
--  command = "lua vim.lsp.buf.formatting_sync(nil, 5000)",
--  group = lspGrp,
--})
-- # vim: foldmethod=marker
