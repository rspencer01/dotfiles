"these lines are suggested to be at the top of every colorscheme
hi clear
if exists("syntax_on")
  syntax reset
endif

"Load the 'base' colorscheme - the one we are altering
runtime colors/molokai.vim

"Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "my-molokai"

if &t_Co>255
  hi CursorLineNr ctermbg=235
  hi VertSplit ctermbg=244
  hi String ctermfg=130
  hi ErrorMsg ctermfg=82 ctermbg=52
endif
