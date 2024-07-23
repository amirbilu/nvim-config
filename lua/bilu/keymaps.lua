local api = vim.api

local map = function(key, map)
	api.nvim_set_keymap("", key, map, { noremap = true })
end

local nnoremap = function(key, map)
	api.nvim_set_keymap("n", key, map, { noremap = true })
end

local inoremap = function(key, map)
	api.nvim_set_keymap("i", key, map, { noremap = true })
end

local tnoremap = function(key, map)
	api.nvim_set_keymap("t", key, map, { noremap = true })
end

local cnoremap = function(key, map)
	api.nvim_set_keymap("c", key, map, { noremap = true })
end

local xnoremap = function(key, map)
	api.nvim_set_keymap("x", key, map, { noremap = true })
end

inoremap("jk", "<ESC>")
inoremap("<C-j>", "<C-o>j")
inoremap("<C-k>", "<C-o>k")
inoremap("<C-l>", "<C-o>l")
inoremap("<C-h>", "<C-o>h")
cnoremap("jk", "<ESC><CR>")

-- buffer navigation
nnoremap("<leader>l", ":bnext<CR>")
nnoremap("<leader>l", ":bnext<CR>")
nnoremap("<leader>h", ":bprevious<CR>")
nnoremap("<leader>x", ":bdelete<CR>")
nnoremap("<leader>l", ":bnext<CR>")
nnoremap("<leader>f", ":ALEFix<CR>")

-- nvim tree
nnoremap("<leader>nn", ":NvimTreeToggle<CR>")
nnoremap("<leader>nf", ":NvimTreeFindFile<CR>")

-- lsp-zero
nnoremap("<leader>f", ":lua vim.lsp.buf.format()<CR>")
nnoremap("<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
nnoremap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
api.nvim_create_autocmd("BufWrite", { pattern = { "*" }, callback = vim.lsp.buf.format })

-- telescope
nnoremap("<leader>p", ":Telescope find_files<CR>")
nnoremap("<leader>/", ":Telescope live_grep<CR>")
nnoremap("gr", ":Telescope lsp_references<CR>")
nnoremap("gd", ":Telescope lsp_definitions<CR>")

-- toggle terminal
nnoremap("<leader>t", ":ToggleTerm<CR>")
tnoremap("<esc>", "<C-\\><C-n>")
tnoremap("jk", "<C-\\><C-n>")

-- tabnine
-- nnoremap("<leader>q", ":TabnineChat<CR>")
-- xnoremap("<leader>q", ":<C-U>TabnineChat<CR>")

api.nvim_set_keymap("x", "<leader>q", "", { noremap = true, callback = require("tabnine.chat").open })
api.nvim_set_keymap("i", "<leader>q", "", { noremap = true, callback = require("tabnine.chat").open })
api.nvim_set_keymap("n", "<leader>q", "", { noremap = true, callback = require("tabnine.chat").open })
