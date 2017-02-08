" Install all our plugins
execute pathogen#infect()

" I can't live with only esc!
imap jj <esc>

" Remember a longer history
set history=1000

" The numbers down the left are a must in any text editor
set number

" Personal whitespace settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab

" Detect filetype
filetype indent on

" Filetype specific tabs and spaces
if has("autocmd")
  " These are required by files
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " House customisations
endif

" Let me move away from hidden buffers without complaining
set hidden

" Easy recognition for where the cursor is
augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" Autocompleting menu with prompts
set wildmenu
" Don't scroll though these files
set wildignore=*.o,*~,*.pyc

set incsearch
set hlsearch
" Ignore case when searching
set ignorecase

" Start unfolded, fold with spaces (for now)
set foldlevelstart=99
set foldmethod=indent
set foldignore=

" Easy navigation commands
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Splitting in reasonable locations
set splitbelow
set splitright

" Highlight in red trailing spaces
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

let g:airline_powerline_fonts = 1

" BUCK files are python files actually...
au BufRead,BufNewFile BUCK setfiletype python
