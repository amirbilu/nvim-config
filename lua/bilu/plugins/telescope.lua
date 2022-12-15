local actions = require "telescope.actions"
local config = require "telescope.config"

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

vim.api.nvim_set_keymap('n', '<Leader>p', ':Telescope find_files<cr>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>/', ':Telescope live_grep<cr>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', 'gr', ':Telescope lsp_references<cr>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', 'gd', ':Telescope lsp_definitions<cr>',
                        {noremap = true})
