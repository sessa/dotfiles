set nocompatible

silent! call pathogen#runtime_append_all_bundles()


"filetype off
"call pathogen#helptags()

syntax enable
filetype plugin indent on

"remap leader to ,
let mapleader=","

"use ; as the command leader
nnoremap ; :
vnoremap ; :

colorscheme hammer

set showcmd				"Display incomplete commands
set showmode			"Show the mode your in
set backspace=indent,eol,start

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

set wildmenu				      "Enhance command line completion
set wildmode=list:longest	"Just like the shell

set ignorecase "case-insensitive searching
set smartcase  "ignore case if search is lowercase; case-sensitive otherwise

"Keep more context when scrolling off the end of a buffer
set scrolloff=3

"Set tab sizes
set tabstop=2
set shiftwidth=2
set expandtab

"Incremental, matched, highlighted searches
set incsearch
set showmatch
set hlsearch

"disable backup and swaps
set nobackup
set noswapfile

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"Remove toolbar for guis
if has("gui_running")
    set go-=T
end

" Remap the tab key to do autocompletion or indentation depending on the
" context (from http://www.vim.org/tips/tip.php?tip_id=102)
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

set title
set visualbell   "no beeping!
set noerrorbells "no beeping!

set relativenumber
"set number  "incompatibly with relativenumber
set gdefault
"set nocompatible
set autoindent
set autowrite
set autowriteall

set history=1000
set undolevels=1000

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

"better splitting
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"run specs on current file
map <leader>t :!rspec %<cr>

"close window
map <leader>qw <C-w>q<cr>

"clear current search
nnoremap <leader><space> :noh<cr>

"remove file from buffer
nmap :bd <plug>Kwbd

"auto save when losing focus
au FocusLost * :wa
