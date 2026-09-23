require("blink.cmp").setup({
	keymap = {
		preset = "none",
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-o>"] = { "select_and_accept", "fallback" },
		["<CR>"] = { "accept", "fallback" },
		["<C-Space>"] = { "show", "fallback" },
	},
	completion = {
		list = { selection = { preselect = false } },
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer", "spell" },
		providers = {
			spell = {
				name = "Spell",
				module = "blink-cmp-spell",
				enabled = function()
					return vim.wo.spell
				end,
			},
		},
	},
})
