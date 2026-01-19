require("lualine").setup({
	tabline = {
		lualine_a = {},
		lualine_b = { "branch" },
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	sections = {
		lualine_c = {
			{
				function()
					return vim.lsp.status()
				end,
			},
		},
		lualine_x = { "tabnine" },
	},
})
