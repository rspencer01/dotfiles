" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

" Git operations in vim
Plug 'tpope/vim-fugitive'

" Git symbols in sidebar
Plug 'airblade/vim-gitgutter'

" Syntax highlighting for glsl
Plug 'tikhomirov/vim-glsl'

" Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify and many more
Plug 'ryanoasis/vim-devicons'

" Conceal strings for TeX
" Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'lervag/vimtex'

" Syntax for toml
Plug 'cespare/vim-toml'

" Have to have Tab
Plug 'godlygeek/tabular'

" A simple vim plugin for toggling the display of the quickfix list and the location-list.
Plug 'Valloric/ListToggle'

" NERDTree is pretty good
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'majutsushi/tagbar'

Plug 'mbbill/undotree'

" Needs neovim 0.3.2
" On setup run CocInstall coc-rust-analyzer
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Needs neovim > 0.2.2 at least
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Better JSON highlighting
Plug 'elzr/vim-json'

" Search number
Plug 'google/vim-searchindex'
" 
" Below are from d3zmodos.  Check before adding
" " FZF
" " TODO: do highlight yank
" " TODO: look for incrimental substitute
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Unix commands in the buffer
Plug 'tpope/vim-eunuch'

" Indent bars
Plug 'Yggdroot/indentLine'

" Tagbar but for LSP
Plug 'liuchengxu/vista.vim'

" Rust?
Plug 'rust-lang/rust.vim'

" Surround
Plug 'tpope/vim-surround'

" Start page
Plug 'mhinz/vim-startify'

" Nice bookmarks
Plug 'MattesGroeger/vim-bookmarks'

" Black formatting
Plug 'psf/black', { 'branch': 'stable' }

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
