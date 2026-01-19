-- Using vim.keymap.set (recommended in Neovim 0.11+)
local map = vim.keymap.set

-- Insert mode
map("i", "jk", "<ESC>")
map("i", "<C-j>", "<C-o>j")
map("i", "<C-k>", "<C-o>k")
map("i", "<C-l>", "<C-o>l")
map("i", "<C-h>", "<C-o>h")

-- Command mode
map("c", "jk", "<ESC><CR>")

-- Buffer navigation
map("n", "<leader>l", "<cmd>bnext<CR>")
map("n", "<leader>h", "<cmd>bprevious<CR>")
map("n", "<leader>x", "<cmd>bdelete<CR>")

-- nvim tree
map("n", "<leader>nn", "<cmd>NvimTreeToggle<CR>")
map("n", "<leader>nf", "<cmd>NvimTreeFindFile<CR>")

-- LSP
map("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.api.nvim_create_autocmd("BufWrite", { pattern = { "*" }, callback = vim.lsp.buf.format })

-- Telescope
map("n", "<leader>p", "<cmd>Telescope find_files<CR>")
map("n", "<leader>/", "<cmd>Telescope live_grep<CR>")
map("n", "gr", "<cmd>Telescope lsp_references<CR>")
map("n", "gd", "<cmd>Telescope lsp_definitions<CR>")

-- Toggle terminal
map("n", "<leader>t", "<cmd>ToggleTerm<CR>")
map("t", "<esc>", "<C-\\><C-n>")
map("t", "jk", "<C-\\><C-n>")

-- Tabnine chat
map({ "n", "i", "x" }, "<leader>q", require("tabnine.chat").open, { desc = "Open Tabnine chat" })

-- Tabnine CLI
map("n", "<leader>tt", "<cmd>TabnineCliToggle<cr>", { desc = "Toggle Tabnine CLI" })
map("n", "<leader>ta", "<cmd>TabnineCliAcceptDiff<cr>", { desc = "Accept Tabnine diff" })
map("n", "<leader>tr", "<cmd>TabnineCliRejectDiff<cr>", { desc = "Reject Tabnine diff" })
