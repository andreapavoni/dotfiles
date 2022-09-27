require('bufferline').setup({
	options = {
		indicator = {icon = '▎'},
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		numbers = 'none',
		-- mappings = true,
		close_command = 'bdelete! %d',
		right_mouse_command = 'bdelete! %d',
		left_mouse_command = 'buffer %d',
		middle_mouse_command = nil,
		show_close_icon = 'true',
		seperator_style = 'padded_slant',
		diagnostics = 'nvim_lsp',
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return '(' .. count .. ')'
		end,
		custom_filter = function(buf_number, buf_numbers)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "terminal" then
        return true
      end
		end,
	},
})
