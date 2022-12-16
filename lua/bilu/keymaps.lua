local leader = ","

local nnoremap = function(key, map)
    vim.api.nvim_set_keymap("n", key, map, {noremap = true})
end

local inoremap = function(key, map)
    vim.api.nvim_set_keymap("i", key, map, {noremap = true})
end

inoremap("jk", "<ESC>")

-- buffer navigation
nnoremap("<leader>l", ":bnext<CR>")
nnoremap("<leader>l", ":bnext<CR>")
nnoremap("<leader>h", ":bprevious<CR>")
nnoremap("<leader>x", ":bdelete<CR>")
nnoremap("<leader>l", ":bnext<CR>")
nnoremap("<leader>f", ":ALEFix<CR>")

-- nvim tree
nnoremap("<leader>nn", "NvimTreeToggle")
nnoremap("<leader>nf", "NvimTreeFindFile")

return {nnoremap = nnoremap}
