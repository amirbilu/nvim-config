local leader = ","

local nnoremap = function(key, map)
    vim.api.nvim_set_keymap("n", leader .. key, ":" .. map .. "<CR>",
                            {noremap = true})
end

local inoremap = function(key, map)
    vim.api.nvim_set_keymap("i", key, map,
                            {noremap = true})
end


inoremap("jk", "<ESC>")

-- buffer navigation
nnoremap("l", "bnext")
nnoremap("l", "bnext")
nnoremap("h", "bprevious")
nnoremap("x", "bdelete")
nnoremap("l", "bnext")
nnoremap("f", "ALEFix")

-- nvim tree
nnoremap("nn", "NvimTreeToggle")
nnoremap("nf", "NvimTreeFindFile")

return { nnoremap = nnoremap }
