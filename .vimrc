imap jj <esc>

set number

set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
filetype indent on

set cursorline

set wildmenu

"set showmatch

set incsearch
set hlsearch

set foldlevelstart=99
set foldmethod=indent
set foldignore=

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

syntax on
set backspace=2
set scrolloff=5

au BufNewFile,BufRead *.less set filetype=css

hi  Folded ctermbg=8