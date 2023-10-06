local function lsp_client(msg)
	msg = msg or ""
	local buf_clients = vim.lsp.buf_get_clients()
	if next(buf_clients) == nil then
		if type(msg) == "boolean" or #msg == 0 then
			return ""
		end
		return msg
	end

	local buf_ft = vim.bo.filetype
	local buf_client_names = {}

	-- add client
	for _, client in pairs(buf_clients) do
		if client.name ~= "null-ls" then
			table.insert(buf_client_names, client.name)
		end
	end

	-- add formatter
	local formatters = require("plugins.lsp.null-ls.formatters")
	local supported_formatters = formatters.list_registered(buf_ft)
	vim.list_extend(buf_client_names, supported_formatters)

	-- add linter
	local linters = require("plugins.lsp.null-ls.linters")
	local supported_linters = linters.list_registered(buf_ft)
	vim.list_extend(buf_client_names, supported_linters)

	-- add hover
	local hovers = require("plugins.lsp.null-ls.hovers")
	local supported_hovers = hovers.list_registered(buf_ft)
	vim.list_extend(buf_client_names, supported_hovers)

	return "[" .. table.concat(buf_client_names, ", ") .. "]"
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		component_separators = "",
		section_separators = "",
		theme = "palenight",
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			{
				"filetype",
				file_status = true, -- displays file status (readonly status, modified status)
				path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
			},
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " " },
			},
			"encoding",
		},
		lualine_y = { lsp_client },
		lualine_z = { "progress", "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
				"filename",
				file_status = true, -- displays file status (readonly status, modified status)
				path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
			},
		},
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
