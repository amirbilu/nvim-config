local actions = require "telescope.actions"
local config = require "telescope.config"
local nnoremap = require('bilu.keymaps').nnoremap

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-o>"] = actions.select_default
            }
        }
    }
}


