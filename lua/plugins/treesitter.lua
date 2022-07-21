require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "rust" },

  context_commentstring = {
    enable = true
  },

  sync_install = false,

  highlight = {
    enable = true,
  },
}
