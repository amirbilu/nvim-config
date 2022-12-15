local leader = ","

local nnoremap = function(key, map)
    vim.api.nvim_set_keymap("n", leader .. key, ":" .. map .. "<CR>",
                            {noremap = true})
end

-- Buffer navigation
nnoremap("l", "bnext")
nnoremap("h", "bprevious")
nnoremap("x", "bdelete")
nnoremap("l", "bnext")
nnoremap("f", "ALEFix")

-- Nvim tree
nnoremap("nn", "NvimTreeToggle")
nnoremap("nf", "NvimTreeFindFile")
