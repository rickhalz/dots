local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup({
	function(use)
		-- Mandatory --
		use("wbthomason/packer.nvim")
		use("nvim-lua/plenary.nvim")

		-- Theme
		use({ "folke/tokyonight.nvim" })
		-- Colorizer
		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
			end,
		})

		-- Icons
		use({ "kyazdani42/nvim-web-devicons" })

		-- Greeter
		use({
			"glepnir/dashboard-nvim",
			config = function()
				require("plugins/dashboard")
			end,
		})

		-- Statusline
		use({
			"nvim-lualine/lualine.nvim",
			event = "BufEnter",
			config = function()
				require("plugins/lualine")
			end,
		})

		-- Bufferline
		use({
			"akinsho/bufferline.nvim",
			config = function()
				require("plugins/bufferline")
			end,
		})

		-- Surround
		use({
			"kylechui/nvim-surround",
			tag = "*",
			config = function()
				require("nvim-surround").setup({})
			end,
		})

		-- Terminal
		use({
			"s1n7ax/nvim-terminal",
			config = function()
				vim.o.hidden = true
				require("nvim-terminal").setup()
			end,
		})

		-- Syntax highlighting
		use({
			"kyazdani42/nvim-tree.lua",
			config = function()
				require("plugins/nvimtree")
			end,
		})
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("plugins/treesitter")
			end,
		})
		use({
			"nvim-treesitter/playground",
			after = "nvim-treesitter",
		})
		use({
			"windwp/nvim-ts-autotag",
			after = "nvim-treesitter",
		})
		use({
			"windwp/nvim-autopairs",
			after = "nvim-cmp",
			config = function()
				require("plugins/autopairs")
			end,
		})
		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("plugins/lsp")
			end,
		})
		use({
			"williamboman/mason.nvim",
			config = function()
				require("plugins/mason")
			end,
		})
		use({ "hrsh7th/cmp-nvim-lsp" })
		use({ "hrsh7th/cmp-buffer" })
		use({ "hrsh7th/nvim-cmp" })
		use({ "hrsh7th/cmp-path" })
		use({ "hrsh7th/cmp-vsnip" })
		use({ "hrsh7th/vim-vsnip" })
		use({ "onsails/lspkind-nvim" })
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufRead",
			config = function()
				require("plugins/indent")
			end,
		})
		use({
			"numToStr/Comment.nvim",
			event = "BufRead",
			config = function()
				require("Comment").setup()
			end,
		})
		use({
			"lewis6991/gitsigns.nvim",
			event = "BufRead",
			config = function()
				require("plugins/gitsigns")
			end,
		})
		use({
			"rhysd/git-messenger.vim",
			event = "BufRead",
			config = function()
				require("plugins/messenger")
			end,
		})
		-- use({
		-- 	"glepnir/lspsaga.nvim",
		-- 	config = function()
		-- 		require("plugins/lspsaga")
		-- 	end,
		-- })
		use({
			"gorbit99/codewindow.nvim",
			config = function()
				local codewindow = require("codewindow")
				codewindow.setup()
				codewindow.apply_default_keybinds()
			end,
		})
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				{ "nvim-telescope/telescope-live-grep-args.nvim" },
				{ "nvim-telescope/telescope-symbols.nvim" },
			},
			config = function()
				require("plugins/telescope")
			end,
		})
		use({
			"nvim-zh/colorful-winsep.nvim",
			config = function()
				require("colorful-winsep").setup()
			end,
		})
		use({
			"j-hui/fidget.nvim",
			tag = "legacy",
			config = function()
				require("fidget").setup({})
			end,
		})
		use({
			"folke/trouble.nvim",
			require = {
				{ "nvim-tree/nvim-web-devicons" },
			},
			config = function()
				require("trouble").setup()
			end,
		})
		use({
			"jose-elias-alvarez/null-ls.nvim",
			event = "BufRead",
			config = function()
				require("plugins/null-ls")
			end,
		})
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
