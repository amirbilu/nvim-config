local cmp = require 'cmp'
local types = require('cmp.types')
-- local tabnine = require('cmp_tabnine.config')

cmp.setup({
    sources = cmp.config.sources({
        {name = 'nvim_lsp'}, {name = 'buffer'}, {name = 'path'}
        -- { name = 'cmp_tabnine' },
    }),
    snippet = {
        expand = function(args)
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end
    },
    experimental = {ghost_text = false},
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = {
            i = cmp.mapping.select_next_item({
                behavior = types.cmp.SelectBehavior.Insert
            })
        },
        ['<S-Tab>'] = {
            i = cmp.mapping.select_prev_item({
                behavior = types.cmp.SelectBehavior.Insert
            })
        },
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    })
})

