require('nvim-tree').setup({
	view = {
		hide_root_folder = false,
		width = 25,
		side = 'left',
		adaptive_size = true,
	},
	filters = {
		dotfiles = false,
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	disable_netrw = true,
	hijack_netrw = true,
	hijack_cursor = true,
	git = {
		ignore = false,
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	filesystem_watchers = {
		enable = true,
	},
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = false,
	},
	renderer = {
		indent_width = 2,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			webdev_colors = true,
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},

			glyphs = {
				default = "",
				symlink = "",
				folder = {
					default = "",
					empty = "",
					empty_open = "",
					open = "",
					symlink = "",
					symlink_open = "",
					arrow_open = "",
					arrow_closed = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
})

vim.keymap.set('n', '<C-n>', '<CMD>NvimTreeToggle<CR>')
