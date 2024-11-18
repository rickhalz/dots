local null_ls = require("null-ls")
local fmt = null_ls.builtins.formatting
local dgn = null_ls.builtins.diagnostics
local cda = null_ls.builtins.code_actions
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

null_ls.setup({
	sources = {
		-- Formatting --
		fmt.trim_whitespace.with({
			filetypes = { "text", "zsh", "make", "conf" },
		}),
		fmt.prettier,
		fmt.black,
		fmt.gofmt,
		fmt.cmake_format,
		fmt.rustfmt,
		fmt.shfmt,
		fmt.stylua,
		fmt.djlint,
		-- Diagnostics --
		dgn.flake8,
		dgn.eslint.with({
			method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
		}),

		dgn.flake8.with({
			method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
		}),
		null_ls.builtins.hover.dictionary,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})
