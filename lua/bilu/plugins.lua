local M = require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'

    use 'nvim-lua/plenary.nvim'

    use 'Rigellute/rigel'

    -- lsp
    use 'neovim/nvim-lspconfig'

    use 'williamboman/nvim-lsp-installer'

    use 'hrsh7th/nvim-cmp'

    use 'codota/tabnine-nvim'

    use 'nvim-telescope/telescope.nvim'

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    use 'nvim-treesitter/nvim-treesitter-context'

    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- layout
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons' -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- others
    use 'tpope/vim-commentary'

    -- lint / format
    use 'dense-analysis/ale'

end)

for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config') ..
                                         '/lua/bilu/plugins')) do
    print('bilu.plugins.' .. file:gsub('%.lua$', ''))
    require('bilu.plugins.' .. file:gsub('%.lua$', ''))
end

return M
