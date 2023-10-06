require('bufferline').setup{
	options = {
		indicator = {
			style = 'icon',
		},
		show_close_icon = false,
		color_icons = true,
		show_buffer_close_icons = false,
		modified_icon = "●",
		offsets = {
			{
				filetype = 'NvimTree',
				text = 'File Browser',
				highlight = 'Directory',
				padding = 1,
			},
		},
	},
	highlights = {
		buffer_selected = {
      fg = '#f7768e',
    },
  },
}

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>')
