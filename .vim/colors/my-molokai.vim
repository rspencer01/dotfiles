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
  hi Normal        ctermbg=none
  hi CursorLine    ctermbg=none   cterm=none
  hi Folded        ctermbg=none ctermfg=67

  hi DiffAdd       ctermbg=22
  hi DiffChange      ctermbg=236
  hi DiffDelete    ctermbg=52  ctermfg=88
  hi DiffText      ctermbg=238 cterm=bold

  hi GitGutterAdd    ctermfg=2
  hi GitGutterChange ctermfg=3
  hi GitGutterDelete ctermfg=1

  hi Conceal ctermbg=none ctermfg=39

  hi Todo ctermfg=34 ctermbg=none cterm=bold

  hi rustStructure ctermfg=79 cterm=italic
endif
