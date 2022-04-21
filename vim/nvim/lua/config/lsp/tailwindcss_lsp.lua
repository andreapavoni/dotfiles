--[[ Setup script for the tailwindcss lsp server
--]]

local lspconfig = require('lspconfig')
local on_attach = require('config.lsp.setup').on_attach

local tailwindcss_path = vim.fn.stdpath('data') .. '/lsp_servers/tailwindcss_npm/node_modules/@tailwindcss/language-server/bin/tailwindcss-language-server'

lspconfig.tailwindcss.setup{
	on_attach = on_attach,
	cmd = { tailwindcss_path, "--stdio" },
filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "django-html", "htmldjango", "edge", "eelixir", "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte" },
}
