" Vim Color File
" Maintainer:    Nishant Varma <nishant.varma@gmail.com>
" Recent Change: 03 May 2015

" About:
" Panorama is a high contrast theme for the terminal vim using 256 colors.
" It tries to create maximum contrast using the 256 colors
" available in the terminal emulators. As the code beauty increases the
" beauty of the theme increases! This is a work in progress.

" #TODO https://gist.github.com/romainl/5cd2f4ec222805f49eca

" Help
" :he group-name
" :he highlight-groups
" :he cterm-colors

" Fonts:
" DejaVu Sans Mono
" Monaco
" Terminus

if version > 580
    " No guarantees for version 5.8 and below, but this makes it stop
    " Complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let g:colors_name="panorama"

hi Normal         cterm=none       ctermfg=none  ctermbg=none
hi SpecialKey     cterm=none       ctermfg=196   ctermbg=none
hi ColorColumn    cterm=none       ctermfg=none  ctermbg=none
hi StatusLine     cterm=none       ctermfg=231   ctermbg=234
hi StatusLineNC   cterm=none       ctermfg=238   ctermbg=234
hi Error          cterm=none       ctermfg=none  ctermbg=none
hi ErrorMsg       cterm=none       ctermfg=none  ctermbg=none
hi VertSplit      cterm=none       ctermfg=234   ctermbg=234
hi Visual         cterm=none       ctermfg=none  ctermbg=235
hi Search         cterm=none       ctermfg=231   ctermbg=17
hi FoldColumn     cterm=none       ctermbg=none
hi SpellBad       cterm=none       ctermfg=231   ctermbg=52
hi Pmenu          cterm=none       ctermfg=none  ctermbg=234
hi PmenuSel       cterm=standout   ctermfg=none  ctermbg=234
hi PmenuSbar      cterm=none       ctermfg=none  ctermbg=234
hi DiffAdd        cterm=none       ctermfg=193   ctermbg=22
hi DiffDelete     cterm=none       ctermfg=16    ctermbg=52
hi DiffChange     cterm=none       ctermfg=none  ctermbg=24
hi DiffText       cterm=reverse    ctermfg=81    ctermbg=16
hi ModeMsg        cterm=none
hi NonText        cterm=none       ctermfg=233   ctermbg=none
hi Directory      cterm=none       ctermfg=45    ctermbg=none
hi IncSearch      cterm=reverse    ctermfg=none
hi MoreMsg        cterm=none       ctermfg=none
hi ModeMsg        cterm=none       ctermfg=none
hi LineNr         cterm=none       ctermfg=102   ctermbg=none
hi SignColumn     cterm=none       ctermfg=102   ctermbg=none
hi Question       cterm=none       ctermfg=214   ctermbg=none
hi CursorLine     cterm=none       ctermfg=none  ctermbg=234
hi VisualNOS      cterm=none       ctermfg=none
hi WarningMsg     cterm=standout   ctermfg=none
hi WildMenu       cterm=standout   ctermfg=none  ctermbg=none
hi Folded         cterm=none       ctermfg=102   ctermbg=237
hi Comment        cterm=none       ctermfg=238
hi Operator       cterm=none       ctermfg=154
hi Function       cterm=none       ctermfg=214   
hi String         cterm=none       ctermfg=118
hi Number         cterm=none       ctermfg=197
hi PreProc        cterm=none       ctermfg=214
hi Constant       cterm=none       ctermfg=197
hi Special        cterm=none       ctermfg=197   ctermbg=none
hi Statement      cterm=none       ctermfg=197
hi Type           cterm=none       ctermfg=33
hi Title          cterm=none       ctermfg=214
hi Identifier     cterm=none       ctermfg=197
hi Underlined     cterm=none       ctermfg=none
hi Ignore         cterm=none       ctermfg=none
hi Todo           cterm=bold       ctermfg=none  ctermbg=none
hi MatchParen     cterm=none       ctermfg=16    ctermbg=15
hi DiffFile       cterm=none       ctermfg=39
hi DiffRemoved    cterm=none       ctermfg=234   ctermbg=238
hi DiffAdded      cterm=none       ctermfg=15    ctermbg=23
hi DiffText       cterm=none       ctermfg=0     ctermbg=113
hi netrwMarkFile  cterm=reverse
hi TabLine        cterm=none       ctermfg=none  ctermbg=234
hi TabLineFill    cterm=none       ctermfg=none  ctermbg=234
hi TabLineSel     cterm=bold       ctermfg=none  ctermbg=238

"Languages

hi htmlBold       cterm=none       ctermfg=none  ctermbg=none


"Links
hi! link pythonDocString Comment
hi! link pythonRepeat Question
hi! link pythonConditional Type

"Plugins

"CtrlP
hi link CtrlPMatch Normal
hi link CtrlPMode1 StatusLine
hi link CtrlPMode2 StatusLine
