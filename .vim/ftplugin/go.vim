set enc=utf-8

" let g:go_fmt_fail_silently = 1
let g:go_def_mapping_enabled=0
let g:go_fmt_command = "gofmt" "Explicited the formater plugin (gofmt, goimports, goreturn...)

" Show a list of interfaces which is implemented by the type under your cursor
nmap <Leader>s <Plug>(go-implements)

" Show type info for the word under your cursor
nmap <Leader>i <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor
nmap <Leader>gd <Plug>(go-doc)
nmap <Leader>gv <Plug>(go-doc-vertical)

" Open the Godoc in browser
nmap <Leader>gb <Plug>(go-doc-browser)

" Run/build/test/coverage
nmap <leader>r <Plug>(go-run)
nmap <leader>b <Plug>(go-build)
nmap <leader>t <Plug>(go-test)
nmap <leader>c <Plug>(go-coverage)

" By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" Tasks
nmap <silent> <F8> :vimgrep /TODO\\|FIXME/gj **/*.go \| copen<CR>
