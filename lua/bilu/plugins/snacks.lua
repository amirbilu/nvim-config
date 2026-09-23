require("snacks").setup({
	explorer = { enabled = true },
	picker = {
		enabled = true,
		win = {
			input = {
				keys = {
					["<C-o>"] = { "confirm", mode = { "i", "n" } },
					["jk"] = { "cancel", mode = "i" },
				},
			},
			list = {
				keys = {
					["<C-o>"] = "confirm",
				},
			},
		},
		sources = {
			files = { hidden = true, exclude = { ".git", ".vscode" } },
			grep = { hidden = true, exclude = { ".git", ".vscode" } },
			explorer = {
				hidden = false,
				layout = { layout = { position = "right" } },
			},
		},
	},
})
