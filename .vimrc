" Install all our plugins
execute pathogen#infect()

" I can't live with only esc!
imap jj <esc>

" Remember a longer history
set history=1000

" The numbers down the left are a must in any text editor
set number
set relativenumber

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
  autocmd FileType tex setlocal conceallevel=2
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
set wildignore=*.o,*~,*.pyc,*.lock,*.aux,*.dvi,*.fls,*.fdb_latexmk,*.log,*.pdf,*.out,*.tdo,*.bbl,*.blg
" Nicer, zsh-like completion to maximum substrings
set wildmode=longest:full,full

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
map <leader>t :NERDTreeToggle<cr>


au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.shd set filetype=glsl
au BufNewFile,BufRead *.ASM set filetype=asm

hi  Folded ctermbg=8

" Use my colorscheme (a slight variation on molokai)
colorscheme my-molokai

" Lets assume we are in a 256 color terminal, shall we?
set t_Co=256

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

" Syntastic setup
" https://github.com/vim-syntastic/syntastic

" Put an indicator in the status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Populate the location list
let g:syntastic_always_populate_loc_list = 1
" Don't automatically open the loc list
let g:syntastic_auto_loc_list = 0
" Run syntax checks on buffer open and
let g:syntastic_check_on_open = 1
" Do not run a check when wq'ing
let g:syntastic_check_on_wq = 0
" For python we use flake8 suites
let g:syntastic_python_checkers = ['flake8']

" Limit the syntastic error window to 4 lines in height.
function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors), 4])
    endif
endfunction


nmap <F8> :TagbarToggle<CR>
nmap <F9> :YcmCompleter FixIt<CR>

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_filetype_blacklist = {'notes': 1, 'markdown': 1, 'unite': 1, 'tagbar': 1, 'pandoc': 1, 'qf': 1, 'vimwiki': 1, 'text': 1, 'infolog': 1, 'mail': 1}

" Ultisnips setup
let g:UltiSnipsExpandTrigger="<c-s>"

set mouse=a

set nocompatible
"filetype plugin on
syntax on
let g:vimwiki_list = [{'path': '$HOME/ownCloud/vimwiki/cerebra/wiki'}]
let g:ycm_filetype_blacklist = {'txt' :1 , 'tex': 1 , 'latex' : 1, 'md' : 1}

set formatprg=par\ -w80

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

" NERDTree setup
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Force sourcing of black
source ~/.vim/autoload/black.vim

" Escape in the terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" Airline buffer tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

let g:rust_use_custom_ctags_defs = 1  "ignore https://github.com/rust-lang/rust.vim/blob/master/ctags/rust.ctags
if !exists('g:tagbar_type_rust')
   let g:tagbar_type_rust = {
       \ 'ctagstype' : 'rust',
       \ 'kinds' : [ "https://github.com/universal-ctags/ctags/blob/master/parsers/rust.c#L50-L61",
         \'M:macro,Macro Definition',
         \'P:method,A method',
         \'c:implementation,implementation',
         \'e:enumerator,An enum variant',
         \'f:function,Function',
         \'g:enum,Enum',
         \'i:interface,trait interface',
         \'m:field,A struct field',
         \'n:module,module',
         \'s:struct,structural type',
         \'t:typedef,Type Alias',
         \'v:variable,Global variable',
       \ ]
   \ }
endif

set modeline
set modelines=5

nmap <leader>c :noh<CR>
