set enc=utf-8

set autoindent
set smartindent

set syntax=python
let python_highlight_all=1

" backspace over autoindent, end of line (to join lines), and preexisting test
set backspace=indent,eol,start

autocmd FileType python set omnifunc=pythoncomplete#Complete

set keywordprg=pydoc

set wildignore+=*.pyc

" Tasks
nmap <silent> <F8> :vimgrep /TODO\\|FIXME/gj **/*.py \| copen<CR>
