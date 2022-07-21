call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', {'branch': 'main'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'psf/black', { 'branch': 'main'}
Plug 'puremourning/vimspector'
Plug 'APZelos/blamer.nvim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'Rigellute/rigel'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'arkav/lualine-lsp-progress'
Plug 'kyazdani42/nvim-web-devicons'


Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'

Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" For ultisnips users.
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
call plug#end()


let mapleader = ","
lua require('plugins/lsp')
lua require('plugins/cmp')
lua require('plugins/tree')
lua require('plugins/treesitter')
lua require('plugins/telescope')
lua require('plugins/lualine')
execute printf('source %s/vim/plugins/ale.vim', stdpath('config'))

" General
colorscheme rigel 
" let g:airline_theme='base16_dracula'
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set number
syntax enable
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>x :bdelete<CR>
nnoremap <leader>t :terminal<CR>
"

"Black
nnoremap <leader>bl :Black<CR>

" Blamer
let g:blamer_enabled = 1
