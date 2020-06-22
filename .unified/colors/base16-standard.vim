" Terminal Color Definitions

let s:black = '0'
let s:red = '1'
let s:green = '2'
let s:yellow = '3'
let s:blue = '4'
let s:magenta = '5'
let s:cyan = '6'
let s:gray = '8'
let s:white = '7'

" Theme Setup

hi clear
syntax reset
let g:colors_name = 'base16-standard'

" Highlighting Function

function <sid>hi(group, ctermbg, ctermfg, attr)
    if a:ctermbg != ''
        exec 'hi ' . a:group . ' ctermbg=' . a:ctermbg
    endif
    if a:ctermfg != ''
        exec 'hi ' . a:group . ' ctermfg=' . a:ctermfg
    endif
    if a:attr != ''
        exec 'hi ' . a:group . ' cterm=' . a:attr
    endif
endfunction

" Vim Editor Colors

call <sid>hi('ColorColumn', s:gray, 'none', 'none')
call <sid>hi('Conceal', s:gray, s:black, 'none')
call <sid>hi('Cursor', 'none', 'none', 'none')
call <sid>hi('CursorColumn', s:gray, 'none', 'none')
call <sid>hi('CursorLine', s:gray, s:white, 'none')
call <sid>hi('CursorLineNr', s:gray, 'none', 'none')
call <sid>hi('Debug', s:gray, 'none', 'none')
call <sid>hi('Directory', 'none', s:blue, 'none')
call <sid>hi('Error', s:black, s:white, 'none')
call <sid>hi('ErrorMsg', s:black, s:white, 'none')
call <sid>hi('Exception', 'none', s:yellow, 'none')
call <sid>hi('FoldColumn', s:gray, s:blue, 'none')
call <sid>hi('Folded', 'none', 'none', 'none')
call <sid>hi('Folded', s:gray, s:yellow, 'none')
call <sid>hi('IncSearch', s:yellow, s:black, 'none')
call <sid>hi('LineNr', 'none', 'none', 'none')
call <sid>hi('LineNr', s:gray, 'none', 'none')
call <sid>hi('Macro', 'none', s:red, 'none')
call <sid>hi('MatchParen', s:blue, s:black, 'none')
call <sid>hi('MoreMsg', 'none', 'none', 'none')
call <sid>hi('NonText', 'none', s:black, 'none')
call <sid>hi('Normal', 'none', 'none', 'none')
call <sid>hi('PMenu', s:gray, s:black, 'none')
call <sid>hi('PMenuSel', s:yellow, s:black, 'none')
call <sid>hi('PmenuSbar', s:gray, s:black, 'none')
call <sid>hi('PmenuThumb', 'none', 'none', 'none')
call <sid>hi('SignColumn', 'none', 'none', 'none')
call <sid>hi('StatusLine', s:gray, s:white, 'none')
call <sid>hi('StatusLineNC', s:gray, s:white, 'none')
call <sid>hi('StatusLineTerm', s:gray, s:white, 'none')
call <sid>hi('StatusLineTermNC', s:gray, s:white, 'none')
call <sid>hi('TabLine', 'none', s:gray, 'none')
call <sid>hi('TabLineFill', 'none', 'none', 'none')
call <sid>hi('TabLineSel', s:gray, s:black, 'none')
call <sid>hi('ToolbarButton', 'none', 'none', 'none')
call <sid>hi('VertSplit', s:gray, s:gray, 'none')
call <sid>hi('Visual', s:yellow, s:black, 'none')
call <sid>hi('VisualNOS', 'none', 'none', 'none')
call <sid>hi('Warning', s:black, s:white, 'none')
call <sid>hi('WarningMsg', s:black, s:white, 'none')
call <sid>hi('WildMenu', s:yellow, s:black, 'none')

" Standard Syntax Colors

call <sid>hi('Boolean', 'none', s:cyan, 'none')
call <sid>hi('Character', 'none', s:green, 'none')
call <sid>hi('Comment', 'none', s:gray, 'none')
call <sid>hi('Conceal', 'none', 'none', 'none')
call <sid>hi('Conditional', 'none', s:red, 'none')
call <sid>hi('Constant', 'none', s:magenta, 'none')
call <sid>hi('Define', 'none', s:blue, 'none')
call <sid>hi('Delimiter', 'none', s:blue, 'none')
call <sid>hi('DiffAdd', 'none', s:green, 'none')
call <sid>hi('DiffChange', 'none', s:magenta, 'none')
call <sid>hi('DiffDelete', 'none', s:green, 'none')
call <sid>hi('DiffText', 'none', 'none', 'none')
call <sid>hi('Float', 'none', s:magenta, 'none')
call <sid>hi('Function', 'none', s:green, 'none')
call <sid>hi('Identifier', 'none', s:magenta, 'none')
call <sid>hi('Include', 'none', s:magenta, 'none')
call <sid>hi('Keyword', 'none', s:red, 'none')
call <sid>hi('Label', 'none', s:yellow, 'none')
call <sid>hi('Number', 'none', s:cyan, 'none')
call <sid>hi('Operator', 'none', s:red, 'none')
call <sid>hi('PreProc', 'none', s:magenta, 'none')
call <sid>hi('Question', 'none', s:white, 'none')
call <sid>hi('Repeat', 'none', s:yellow, 'none')
call <sid>hi('Search', s:blue, 'none', 'none')
call <sid>hi('Special', 'none', s:red, 'none')
call <sid>hi('SpecialChar', 'none', s:magenta, 'none')
call <sid>hi('SpecialKey', 'none', s:magenta, 'none')
call <sid>hi('SpellBad', 'none', 'none', 'none')
call <sid>hi('SpellCap', s:gray, s:yellow, 'none')
call <sid>hi('SpellLocal', 'none', 'none', 'none')
call <sid>hi('SpellRare', 'none', 'none', 'none')
call <sid>hi('Statement', 'none', s:red, 'none')
call <sid>hi('StorageClass', 'none', s:blue, 'none')
call <sid>hi('String', 'none', s:yellow, 'none')
call <sid>hi('Structure', 'none', s:green, 'none')
call <sid>hi('Tag', 'none', s:blue, 'none')
call <sid>hi('Title', 'none', s:green, 'none')
call <sid>hi('Todo', s:yellow, s:black, 'none')
call <sid>hi('TooLong', 'none', s:red, 'none')
call <sid>hi('Type', 'none', s:blue, 'none')
call <sid>hi('TypeDef', 'none', s:blue, 'none')
call <sid>hi('Underlined', s:black, s:blue, 'underline')

" Remove functions

delfunction <sid>hi

" Remove Color Variables

unlet s:black s:red s:green s:yellow s:blue s:magenta s:cyan s:white s:gray

" TODO Create a function for linking?
" TODO Support light background

" Vim

highlight! link vimNotation SpecialChar

" Python

highlight! link pythonDocString Comment

" CtrlP

highlight! link CtrlPBufferHid Normal
highlight! link CtrlPBufferPath Normal
highlight! link CtrlPMatch Normal
highlight! link CtrlPMode1 StatusLine
highlight! link CtrlPMode2 StatusLine

" ALE

highlight! link ALEErrorSign Error
highlight! link ALEWarningSign Warning
