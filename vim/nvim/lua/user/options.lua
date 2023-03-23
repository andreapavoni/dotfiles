-- Backup and swap files
vim.opt.backup = false                          -- creates a backup file
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.swapfile = false                        -- creates a swapfile

vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.errorbells = false 											-- auditory stimulation annoying
vim.opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file

-- Search
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.incsearch = true												-- incremental search

-- UI options
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0                         -- always show tabs
vim.opt.ruler = false                           -- hide the line and column number of the cursor position
vim.opt.hidden = true 													-- keeps buffers loaded in the background
vim.opt.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8                       -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.rnu = false 														-- relative line numbers
vim.opt.number = true                           -- set numbered lines
vim.opt.numberwidth = 4                         -- minimal number of columns to use for the line number {default 4}
vim.opt.colorcolumn = '80' 											-- highlight the 80th column 
vim.opt.modeline = true 												-- enable modlines for files
vim.opt.modelines = 5 													-- number of modelines
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- Split options
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window

vim.opt.laststatus = 3                          -- only the last window will always have a status line
vim.opt.showcmd = false                         -- hide (partial) command in the last line of the screen (for performance)
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.fillchars.eob=" "                       -- show empty lines at the end of a buffer as ` ` {default `~`}
vim.opt.shortmess:append "c"                    -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
vim.opt.whichwrap:append("<,>,[,],h,l")         -- keys allowed to move to the previous/next line when the beginning/end of line is reached
vim.opt.iskeyword:append("-")                   -- treats words with `-` as single words
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- This is a sequence of letters which describes how automatic formatting is to be done
vim.opt.linebreak = true
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab

-- Sessions
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- Folding
vim.opt.foldlevel = 20
vim.opt.foldclose = 'all'
vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- GUI / Neovide
vim.opt.guifont = { "FiraCode Nerd Font", ":h15" }
if vim.g.neovide then
	-- vim.opt.guifont = { "Victor Mono", ":h14" }
	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_hide_mouse_when_typing = false
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_input_use_logo = true
	vim.g.neovide_cursor_antialiasing = true
end
