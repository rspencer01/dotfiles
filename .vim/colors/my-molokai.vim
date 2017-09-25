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
  hi VertSplit    ctermbg=244
  hi String                   ctermfg=130 cterm=italic
  hi ErrorMsg     ctermbg=52  ctermfg=82
  hi Visual       ctermbg=238
  hi Comment                  ctermfg=59  cterm=italic

   hi DiffAdd                     ctermbg=22
  hi DiffChange      ctermbg=236
   hi DiffDelete      ctermfg=88 ctermbg=52
   hi DiffText                    ctermbg=238 cterm=bold

  hi rustStructure ctermfg=79 cterm=italic
endif
