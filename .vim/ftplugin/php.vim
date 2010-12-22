" Auto indent after a {
set autoindent
set smartindent

autocmd FileType php :set omnifunc=phpcomplete#CompletePHP

" Correct indentation after opening a phpdocblock and automatic * on every line
set formatoptions=qroct

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

" Toggle taglist
nnoremap <silent> <F6> :TlistToggle<CR>

" Tasks
nmap <silent> <F7> :vimgrep /TODO\\|FIXME/gj **/*.php \| copen<CR>

" Map <F5> to re-build tags file
nmap <silent> <F5>
                \ :!exuberant-ctags -f $HOME/.vim/tags
                \ --langmap="php:+.inc"
                \ -h ".php.inc" -R --totals=yes
                \ --tag-relative=yes --PHP-kinds=+cf-v %:p:h<CR>

" Map ; to run PHP parser check
noremap ; :!php -l %<CR>

" Map ; to "add ; to the end of the line, when missing"
" noremap ; :s/\([^;]\)$/\1;/<cr>

" Map <CTRL>-P to run actual file with PHP CLI
noremap <C-P> :w!<CR>:!php %<CR>

" Map <ctrl>+o to single line mode documentation (in command mode)
nnoremap <C-O> :call PhpDoc()<CR>
" Map <ctrl>+o to multi line mode documentation (in visual mode)
vnoremap <C-O> :call PhpDoc()<CR>

" Change SQL case
vmap <C-x><C-s> :call ChangeSqlCase()<cr>

" PhpAlign
vnoremap <C-x><C-a> :call PhpAlign()<CR>

" Dictionary completion
set dictionary-=~/.vim/dict/php.dict dictionary+=~/.vim/dict/php.dict
set complete-=k complete+=k


" {{{ Alignment

func! PhpAlign() range
    let l:paste = &g:paste
    let &g:paste = 0

    let l:line        = a:firstline
    let l:endline     = a:lastline
    let l:maxlength = 0
    while l:line <= l:endline
		if getline (l:line) =~ '^\s*\/\/.*$'
			let l:line = l:line + 1
			continue
		endif
        let l:index = substitute (getline (l:line), '^\s*\(.\{-\}\)\s*=>\{0,1\}.*$', '\1', "")
        let l:indexlength = strlen (l:index)
        let l:maxlength = l:indexlength > l:maxlength ? l:indexlength : l:maxlength
        let l:line = l:line + 1
    endwhile

	let l:line = a:firstline
	let l:format = "%s%-" . l:maxlength . "s %s %s"

	while l:line <= l:endline
		if getline (l:line) =~ '^\s*\/\/.*$'
			let l:line = l:line + 1
			continue
		endif
        let l:linestart = substitute (getline (l:line), '^\(\s*\).*', '\1', "")
        let l:linekey   = substitute (getline (l:line), '^\s*\(.\{-\}\) *=>\{0,1\}.*$', '\1', "")
        let l:linesep   = substitute (getline (l:line), '^\s*.* *\(=>\{0,1\}\).*$', '\1', "")
        let l:linevalue = substitute (getline (l:line), '^\s*.* *=>\{0,1\}\s*\(.*\)$', '\1', "")

        let l:newline = printf (l:format, l:linestart, l:linekey, l:linesep, l:linevalue)
        call setline (l:line, l:newline)
        let l:line = l:line + 1
    endwhile
    let &g:paste = l:paste
endfunc

" }}}
