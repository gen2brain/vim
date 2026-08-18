let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "gofmt"

let g:go_highlight_functions = 1
let g:go_highlight_types = 1

" Tasks
nnoremap <buffer> <silent> <F8> :vimgrep /TODO\\|FIXME/gj **/*.go \| copen<CR>

let b:undo_ftplugin = (exists('b:undo_ftplugin') ? b:undo_ftplugin . '|' : '')
      \ . 'silent! nunmap <buffer> <F8>'
