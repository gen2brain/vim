set enc=utf-8

set autoindent
set smartindent

autocmd FileType php :set omnifunc=phpcomplete#CompletePHP

" Use php syntax check when doing :make
set makeprg=php\ -l\ %

" Use errorformat for parsing PHP error output
set errorformat=%m\ in\ %f\ on\ line\ %l

" PHP syntax
let php_sql_query = 1
let php_htmlInStrings = 1
let php_baselib = 1
let php_smart_members = 1
let php_alt_properties = 1
let php_highlight_quotes = 1
let php_alt_construct_parents = 1

let tlist_php_settings = 'php;c:class;d:constant;f:function'

" Tasks
nmap <silent> <F8> :vimgrep /TODO\\|FIXME/gj **/*.php \| copen<CR>

" Map ; to run PHP parser check
noremap ; :!php -l %<CR>

" Map <CTRL>-P to run actual file with PHP CLI
noremap <C-P> :w!<CR>:!php %<CR>
