filetype on
filetype plugin on
filetype indent on

syntax on

if has("termguicolors")
    set termguicolors
endif

" Color scheme
if has("gui")
    set background=dark
    colors one
    set guifont=Consolas\ 13
    set guioptions-=T
    set guioptions-=t
    behave mswin
elseif has("win32")
    set background=dark
    colors one
    set guifont=Consolas:h12:cANSI
    let &guioptions = substitute(&guioptions, "t", "", "g")
    let &guioptions = substitute(&guioptions, "T", "", "g")
    behave mswin
else
    if $TERM=="linux"
        colors pablo
        "set t_Co=16
    else
        set background=dark
        colors one
        "set t_Co=256
    endif
endif

" Set root path
if has("win32")
    set rtp+=$VIMRUNTIME,../$VIMRUNTIME/vimfiles
else
    set rtp+=~/.vim
endif

" Disable Generation of Backup Files
set nobackup
set noswapfile

" Completion options
set completeopt=menu,longest
set wildmode=longest,list

" character encoding
set enc=utf-8

" Do not wrap lines automatically
set nowrap

" Highlight current line in insert mode. Disabled for performance.
" autocmd InsertLeave * se nocul
" autocmd InsertEnter * se cul

set tabstop=4
set shiftwidth=4

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

" toggle paste
set pastetoggle=<F2>

" Show line numbers by default
set number

" Use incremental searching
set incsearch

" Case insensitive search
set ignorecase

" Do not highlight search results
set nohlsearch

" Show line, column number, and relative position within a file in the status line
"set ruler

" Always display the status line
"set laststatus=2

"set statusline=
"set statusline+=%2*%-3.3n%0*\                " buffer number
"set statusline+=%f\                          " file name
"set statusline+=%h%1*%m%r%w%0*               " flags
"set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
"set statusline+=%{&encoding},                " encoding
"set statusline+=%{&fileformat}]              " file format
"set statusline+=%=                           " right align
"set statusline+=%2*0x%-8B\                   " current char
"set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=3

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :50  - remember 50 items in command-line history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:50

" Remember up to 100 'colon' commmands and search patterns
" set history=100

" NerdTree
nmap <silent> <F9> :NERDTreeToggle<CR>

" {{{ Command mappings

" backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-C is Copy
vnoremap <C-C> "+y

" CTRL-V is Paste
map <C-V>		"+gP
cmap <C-V>		<C-R>+

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q> <C-V>

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" CTRL-F4 is Close window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>  :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" Quick tab navigation
map <C-t>     :tabnew<CR>
map <C-left>  :tabp<CR>
map <C-right> :tabn<CR>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

nmap <silent> <F9> :NERDTreeToggle<CR>

nmap <F11> :set keymap=serbian-latin<CR>
nmap <F10> :set keymap=<CR>

" delete trailing whitespace (spaces, tabs) from end of each line
nmap <silent> <F12> :%s/[ \t]*$//g<CR>

let $GOROOT = $HOME.'/go'
let $GOPATH = $HOME.'/golang'

let g:ycm_server_python_interpreter='/usr/bin/python'
let g:go_def_mapping_enabled=0
let g:NERDTreeMapActivateNode='<cr>'
let g:airline_theme='one'

" }}}
