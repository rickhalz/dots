local db = require("dashboard")

db.setup({
	theme = "hyper",
	config = {
		header = {
			"██╗  ██╗███╗   ██╗██╗   ██╗ ██╗ ██╗",
			"██║ ██╔╝████╗  ██║██║   ██║███║███║",
			"█████╔╝ ██╔██╗ ██║██║   ██║╚██║╚██║",
			"██╔═██╗ ██║╚██╗██║██║   ██║ ██║ ██║",
			"██║  ██╗██║ ╚████║╚██████╔╝ ██║ ██║",
			"╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═╝ ╚═╝",
			"",
		},
		weak_header = {
			enable = true,
			concat = "happy hacking!",
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
		project = {
			enable = false,
			limit = 5,
			icon = "Recent Projects",
			label = "",
			action = "Telescope find_files cwd=",
		},
		mru = { limit = 5, icon = "Recent Files:", label = "" },
		footer = {
			"",
			"- you must suffer -",
			"",
		},
	},
})
