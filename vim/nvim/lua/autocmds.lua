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

-- Set default file tpye to unix
-- cmd([[ au BufRead,BufNewFile *.* :set ff=unix ]])

-- # vim: foldmethod=marker
