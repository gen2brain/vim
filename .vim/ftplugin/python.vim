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

" Map <F5> to re-build tags file
nmap <silent> <F5>
                \ :!rm $HOME/.vim/tags && ctags -f $HOME/.vim/tags
                \ -h ".py" -R --totals=yes
                \ --tag-relative=yes %:p:h<CR>

" Toggle taglist
nnoremap <silent> <F6> :TlistToggle<CR>

" Tasks
nmap <silent> <F8> :vimgrep /TODO\\|FIXME/gj **/*.py \| copen<CR>

" Change SQL case
vmap <C-x><C-s> :call ChangeSqlCase()<cr>
