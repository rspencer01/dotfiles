" Install all our plugins
execute pathogen#infect()

" I can't live with only esc!
imap jj <esc>

" Remember a longer history
set history=1000

" The numbers down the left are a must in any text editor
set rnu
set nu

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
  autocmd FileType groovy setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType rust setlocal ts=4 sts=4 sw=4 expandtab
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

" If showing whitespace, use these characters
set listchars=tab:▸\ ,eol:¬

" Easy navigation commands between splits
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

" Spell options
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_gb

" On long lines up and down can move you within the line
"map j gj
"map k gk

" Always show the status line
set laststatus=2

set wrap
set linebreak

" Easy paste mode
map <leader>pp :setlocal paste!<cr>
map <leader>n :noh<cr>
map <leader>t :NERDTree<cr>


au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.shd set filetype=glsl
au BufNewFile,BufRead *.ASM set filetype=asm

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

" Setup for indent guide
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey  ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=blue ctermbg=236
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

let g:airline_powerline_fonts=1

set lazyredraw

" BUCK files are python files actually...
au BufRead,BufNewFile BUCK setfiletype python

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = { 'mode' : 'passive','active_filetypes':[],'passive_filetypes':['html']}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

nmap <F8> :TagbarToggle<CR>
nmap <F9> :YcmCompleter FixIt<CR>

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0

set mouse=a

set nocompatible
"filetype plugin on
syntax on
let g:vimwiki_list = [{'path': '$HOME/ownCloud/vimwiki/cerebra/wiki'}]
let g:ycm_filetype_blacklist = {'txt' :1 , 'tex': 1 , 'latex' : 1, 'md' : 1}

:set formatprg=par\ -w80

set runtimepath^=~/.vim/plugin/latexlivepreview.vim

set encoding=UTF-8

set undodir=/home/robert/.vim/undo/
set undofile

set t_ZH=[3m
set t_ZR=[3m

nnoremap <F5> :GundoToggle<CR>

set diffopt+=vertical

" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff
augroup encrypted
  au!
  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  " We don't want a various options which write unencrypted data to disk
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile noundofile nobackup

  " Switch to binary mode to read the encrypted file
  autocmd BufReadPre,FileReadPre *.gpg set bin
  autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null

  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost *.gpg set nobin
  autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

  " Convert all text to encrypted text before writing
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  autocmd BufWritePost,FileWritePost *.gpg u
augroup END

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

source ~/.vim/lean.vimrc
