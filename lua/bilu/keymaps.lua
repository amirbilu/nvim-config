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

-- File explorer
map("n", "<leader>nn", function()
	Snacks.explorer()
end, { desc = "Toggle explorer" })
map("n", "<leader>nf", function()
	Snacks.explorer.reveal({ buf = 0 })
end, { desc = "Reveal current file" })

-- LSP
map("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
-- Picker
map("n", "<leader>p", function()
	Snacks.picker.files()
end, { desc = "Find files" })
map("n", "<leader>/", function()
	Snacks.picker.grep()
end, { desc = "Search text" })
map("n", "gr", function()
	Snacks.picker.lsp_references()
end, { desc = "References" })
map("n", "gd", function()
	Snacks.picker.lsp_definitions()
end, { desc = "Definitions" })

-- Claude Code
map("n", "<leader>ac", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code" })
map("n", "<leader>af", "<cmd>ClaudeCodeFocus<CR>", { desc = "Focus Claude Code" })
map("v", "<leader>as", "<cmd>ClaudeCodeSend<CR>", { desc = "Send selection to Claude" })

-- Codex
map("n", "<leader>cc", "<cmd>CodexFocus<CR>", { desc = "Focus Codex" })
map("n", "<leader>cf", "<cmd>CodexAdd<CR>", { desc = "Add current file to Codex" })
map("v", "<leader>cs", ":<C-U>CodexSendVisual<CR>", { desc = "Send selection to Codex" })

-- Plugin manager list navigation
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lazy",
	callback = function(event)
		map("n", "<C-j>", "]]", { buffer = event.buf, desc = "Next plugin" })
		map("n", "<C-k>", "[[", { buffer = event.buf, desc = "Previous plugin" })
		map("n", "<C-o>", "<CR>", { buffer = event.buf, desc = "Plugin details" })
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "mason",
	callback = function(event)
		map("n", "<C-j>", "j", { buffer = event.buf, desc = "Next package" })
		map("n", "<C-k>", "k", { buffer = event.buf, desc = "Previous package" })
	end,
})

-- Toggle terminal
map("n", "<leader>t", "<cmd>ToggleTerm<CR>")
map("t", "<esc>", "<C-\\><C-n>")
map("t", "jk", "<C-\\><C-n>")
