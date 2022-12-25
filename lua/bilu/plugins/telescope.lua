local actions = require("telescope.actions")
local config = require("telescope.config")

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-o>"] = actions.select_default,
                ["jk"] = actions.close
            }
        }
    }
})
