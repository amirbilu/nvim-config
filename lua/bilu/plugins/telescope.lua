local actions = require "telescope.actions"
local config = require "telescope.config"
local nnoremap = require('bilu.keymaps').nnoremap

require('telescope').setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-o>"] = actions.select_default
            }
        }
    }
}

nnoremap('p', 'Telescope find_files')
nnoremap('/', 'Telescope live_grep')
nnoremap('gr', 'Telescope lsp_references')
nnoremap('gd', 'Telescope lsp_definitions')
