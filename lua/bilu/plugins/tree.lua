-- require'nvim-web-devicons'.setup()
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        side = "right",
        mappings = {list = {{key = "u", action = "dir_up"}}}
    },
    renderer = {group_empty = true},
    filters = {dotfiles = true}
})

vim.api.nvim_set_keymap('n', '<Leader>nn', ':NvimTreeToggle<cr>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>nf', ':NvimTreeFindFile<cr>',
                        {noremap = true})
-- vim.api.nvim_create_autocmd('BufEnter', {
--   pattern = '*',
--   command = 'NvimTreeFindFile | wincmd p'
-- });
