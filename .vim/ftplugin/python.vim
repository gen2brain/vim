set enc=utf-8

set syntax=python

let python_highlight_all=1

set tabstop=4

" Do smart case matching
set smarttab

" no tabs! spaces only..
set expandtab

" if it looks like a tab, we can delete it like a tab
set softtabstop=4

" new line has indentation equal to previous line
set autoindent

" backspace over autoindent, end of line (to join lines), and preexisting test
set backspace=indent,eol,start

" omni completion
autocmd FileType python set omnifunc=pythoncomplete#Complete

set keywordprg=pydoc

set wildignore+=*.pyc

" trim trailing whitespace
" autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

set dictionary-=~/.vim/dict/python.dict dictionary+=~/.vim/dict/python.dict
set complete-=k complete+=k

" Toggle taglist
nnoremap <silent> <F6> :TlistToggle<CR>

" Tasks
nmap <silent> <F7> :vimgrep /TODO\\|FIXME/gj **/*.py \| copen<CR>

" Map <F5> to re-build tags file
nmap <silent> <F5> :! find . -name \*.py -print \| xargs ~/bin/ptags.py<CR>
