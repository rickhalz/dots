local opt = vim.opt
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local prefix = vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")

opt.directory = { prefix .. "/nvim/swp//" }
opt.number = true
opt.relativenumber = true
opt.signcolumn = "auto:2"
opt.cursorline = true
opt.mouse = "a"
opt.scrolloff = 8
opt.tabstop = 2
opt.shiftwidth = 3
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
opt.smarttab = true

keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

keymap.set("i", "<C-l>", "<Esc>V", opts)
keymap.set("i", "kk", "<Esc>", opts)
keymap.set("i", "<C-j>", "<Esc>o", opts)
keymap.set("i", "<C-k>", "<Esc>O", opts)
keymap.set("i", "<C-u>", "<Esc>u", opts)
keymap.set("i", "<C-z>", "<Esc><C-r>")
