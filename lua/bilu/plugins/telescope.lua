local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "^%.git/", "^%.vscode/" },
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-o>"] = actions.select_default,
				["jk"] = actions.close,
			},
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		live_grep = {
			additional_args = { "--hidden" },
		},
	},
})
