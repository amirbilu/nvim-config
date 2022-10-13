let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'typescriptreact': ['eslint'],
\   'python': ['flake8'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'css': ['prettier'],
\   'java': ['google_java_format'],
\   'rust': ['rustfmt'],
\   'python': ['black'],
\   'sql': ['sqlfmt'],
\   'json': ['prettier'],
\   'lua': ['lua-format'],
\   'terraform': ['terraform'],
\}
nnoremap ff :ALEFix<CR>
autocmd FileType javascript,typescript,typescriptreact,css,java autocmd BufWritePre * :ALEFix 


