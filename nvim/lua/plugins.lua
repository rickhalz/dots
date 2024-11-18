local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Mandatory --
	{ "wbthomason/packer.nvim" },
	{ "nvim-lua/plenary.nvim" },

	-- Theme
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		-- load the colorscheme here
	-- 		vim.cmd([[colorscheme tokyonight-night]])
	-- 	end,
	-- },
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme rose-pine-moon]])
		end,
	},

	-- Colorizer
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- Greeter
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("plugins/dashboard")
		end,
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			require("plugins/lualine")
		end,
	},

	-- Bufferline
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("plugins/bufferline")
		end,
	},

	-- Surround
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	-- Terminal
	{ "akinsho/toggleterm.nvim", version = "*", config = true },

	-- Syntax highlighting
	{
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("plugins/nvimtree")
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = { "VeryLazy" },
		dependencies = {
			"nvim-treesitter/playground",
		},
		config = function()
			require("plugins/treesitter")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("plugins/autopairs")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins/lsp")
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("plugins/mason")
		end,
	},
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-vsnip",
	"onsails/lspkind-nvim",
	"L3MON4D3/LuaSnip",
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("plugins/indent")
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("plugins/gitsigns")
		end,
	},
	{
		"rhysd/git-messenger.vim",
		event = "BufRead",
		config = function()
			require("plugins/messenger")
		end,
	},
	-- use({
	-- 	"glepnir/lspsaga.nvim",
	-- 	config = function()
	-- 		require("plugins/lspsaga")
	-- 	end,
	-- })
	{
		"gorbit99/codewindow.nvim",
		config = function()
			local codewindow = require("codewindow")
			codewindow.setup({
				auto_enable = false,
				width_multiplier = 3,
				show_cursor = false,
				window_border = "none",
				use_treesitter = true,
			})
			codewindow.apply_default_keybinds()
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
			{ "nvim-telescope/telescope-symbols.nvim" },
		},
		config = function()
			require("plugins/telescope")
		end,
	},
	{
		"nvim-zh/colorful-winsep.nvim",
		config = function()
			require("colorful-winsep").setup()
		end,
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		config = function()
			require("fidget").setup({})
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
		config = function()
			require("trouble").setup()
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufRead",
		config = function()
			require("plugins/null-ls")
		end,
	},
	{
		"vidocqh/auto-indent.nvim",
		indentexpr = function(lnum)
			return require("nvim-treesitter.indent").get_indent(lnum)
		end,
		opts = {},
	},
})
