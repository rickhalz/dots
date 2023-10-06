local db = require("dashboard")

db.setup({
	theme = "hyper",
	config = {
		header = {
			"",
			"███████╗██████╗ ██╗██████╗  █████╗ ██╗   ██╗",
			"██╔════╝██╔══██╗██║██╔══██╗██╔══██╗╚██╗ ██╔╝",
			"█████╗  ██████╔╝██║██║  ██║███████║ ╚████╔╝ ",
			"██╔══╝  ██╔══██╗██║██║  ██║██╔══██║  ╚██╔╝  ",
			"██║     ██║  ██║██║██████╔╝██║  ██║   ██║   ",
			"╚═╝     ╚═╝  ╚═╝╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
			"",
		},
		shortcut = {
			{ desc = "󰮯 ", group = "@property", action = "Lazy update" },
			{
				desc = "󰊠 ",
				group = "Label",
				action = "Telescope find_files",
			},
			{
				desc = "󰊠 ",
				group = "DiagnosticHint",
				action = "Telescope app",
			},
			{
				desc = "󰊠",
				group = "Number",
				action = "Telescope dotfiles",
			},
		},
		footer = {
			"",
			"飼飼飼I like trains 飼飼飼",
			"",
		},
	},
})
