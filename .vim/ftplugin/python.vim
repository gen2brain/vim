let g:python_highlight_all = 1

" Tasks
nnoremap <buffer> <silent> <F8> :vimgrep /TODO\\|FIXME/gj **/*.py \| copen<CR>

let b:undo_ftplugin = (exists('b:undo_ftplugin') ? b:undo_ftplugin . '|' : '')
      \ . 'silent! nunmap <buffer> <F8>'
