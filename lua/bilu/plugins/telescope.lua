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

nnoremap('<leader>p', ':Telescope find_files<CR>')
nnoremap('<leader>/', ':Telescope live_grep<CR>')
nnoremap('gr', ':Telescope lsp_references<CR>')
nnoremap('gd', ':Telescope lsp_definitions<CR>')
