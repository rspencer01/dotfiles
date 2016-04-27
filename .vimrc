" Install all our plugins
execute pathogen#infect()

imap jj <esc>

" Remember a longer history
set history=1000

set number

set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
filetype indent on

set cursorline
augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

set wildmenu
" Don't scroll though these files
set wildignore=*.o,*~,*.pyc

set incsearch
set hlsearch
" Ignore case when searching
set ignorecase

set foldlevelstart=99
set foldmethod=indent
set foldignore=

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
match ErrorMsg "\s\+$"

syntax on
set backspace=2
set scrolloff=5

" Always show the status line
set laststatus=2

" Easy paste mode
map <leader>pp :setlocal paste!<cr>

au BufNewFile,BufRead *.less set filetype=css

hi  Folded ctermbg=8

" Use my colorscheme (a slight variation on molokai)
colorscheme my-molokai

" Lets assume we are in a 256 color terminal, shall we?
set t_Co=256

" Easy way to resize splits
nmap <C-O> :vertical resize +5<CR>
nmap <C-Y> :vertical resize -5<CR>
nmap <C-I> :resize -5<CR>
nmap <C-U> :resize +5<CR>

set lazyredraw

