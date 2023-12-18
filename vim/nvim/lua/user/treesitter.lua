local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end


local status_ok, ts_comment_string = pcall(require, "ts_context_commentstring")
if not status_ok then
  return
end
vim.g.skip_ts_context_commentstring_module = true
ts_comment_string.setup {}

configs.setup {
	-- one of "all", or a list of languages
	ensure_installed = {"go", "elixir", "rust", "python", "markdown", "markdown_inline", "yaml", "toml", "javascript", "json", "lua"},
  -- ensure_installed = "all",
  ignore_install = { "" }, -- List of parsers to ignore installing
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "css" }, -- list of language that will be disabled
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, disable = { "python", "css" } },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
  -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
  -- Using this option may slow down your editor, and you may see some duplicate highlights.
  -- Instead of true it can also be a list of languages
  additional_vim_regex_highlighting = false,
}
