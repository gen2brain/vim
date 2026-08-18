" Use php syntax check when doing :make
setlocal makeprg=php\ -l\ %

" Use errorformat for parsing PHP error output
setlocal errorformat=%m\ in\ %f\ on\ line\ %l

" PHP syntax
let php_sql_query = 1
let php_htmlInStrings = 1
let php_baselib = 1

" Tasks
nnoremap <buffer> <silent> <F8> :vimgrep /TODO\\|FIXME/gj **/*.php \| copen<CR>

" Map ; to run PHP parser check
nnoremap <buffer> ; :!php -l %<CR>

let b:undo_ftplugin = (exists('b:undo_ftplugin') ? b:undo_ftplugin . '|' : '')
      \ . 'setlocal makeprg< errorformat<'
      \ . '|silent! nunmap <buffer> <F8>|silent! nunmap <buffer> ;'
