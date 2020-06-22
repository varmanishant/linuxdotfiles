" Apprentice.vim -- Vim color scheme.
" Author:      Romain Lafourcade (romainlafourcade@gmail.com)
" Webpage:     https://github.com/romainl/Apprentice

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "apprentice"

if ($TERM =~ '256' || &t_Co >= 256)
    hi Normal ctermbg=235 ctermfg=250 cterm=NONE

    set background=dark

    hi NonText ctermbg=NONE ctermfg=240 cterm=NONE
    hi EndOfBuffer ctermbg=NONE ctermfg=240 cterm=NONE
    hi LineNr ctermbg=234 ctermfg=242 cterm=NONE
    hi FoldColumn ctermbg=234 ctermfg=242 cterm=NONE
    hi Folded ctermbg=234 ctermfg=242 cterm=NONE
    hi MatchParen ctermbg=234 ctermfg=229 cterm=NONE
    hi signColumn ctermbg=234 ctermfg=242 cterm=NONE
    hi Comment ctermbg=NONE ctermfg=240 cterm=NONE
    hi Conceal ctermbg=NONE ctermfg=250 cterm=NONE
    hi Constant ctermbg=NONE ctermfg=208 cterm=NONE
    hi Error ctermbg=NONE ctermfg=131 cterm=reverse
    hi Identifier ctermbg=NONE ctermfg=67 cterm=NONE
    hi Ignore ctermbg=NONE ctermfg=NONE cterm=NONE
    hi PreProc ctermbg=NONE ctermfg=66 cterm=NONE
    hi Special ctermbg=NONE ctermfg=65 cterm=NONE
    hi Statement ctermbg=NONE ctermfg=110 cterm=NONE
    hi String ctermbg=NONE ctermfg=108 cterm=NONE
    hi Todo ctermbg=NONE ctermfg=NONE cterm=reverse
    hi Type ctermbg=NONE ctermfg=103 cterm=NONE
    hi Underlined ctermbg=NONE ctermfg=66 cterm=underline
    hi Pmenu ctermbg=238 ctermfg=250 cterm=NONE
    hi PmenuSbar ctermbg=240 ctermfg=NONE cterm=NONE
    hi PmenuSel ctermbg=66 ctermfg=235 cterm=NONE
    hi PmenuThumb ctermbg=66 ctermfg=66 cterm=NONE
    hi ErrorMsg ctermbg=131 ctermfg=235 cterm=NONE
    hi ModeMsg ctermbg=108 ctermfg=235 cterm=NONE
    hi MoreMsg ctermbg=NONE ctermfg=66 cterm=NONE
    hi Question ctermbg=NONE ctermfg=108 cterm=NONE
    hi WarningMsg ctermbg=NONE ctermfg=131 cterm=NONE
    hi TabLine ctermbg=238 ctermfg=101 cterm=NONE
    hi TabLineFill ctermbg=238 ctermfg=238 cterm=NONE
    hi TabLineSel ctermbg=101 ctermfg=235 cterm=NONE
    hi ToolbarLine ctermbg=234 ctermfg=NONE cterm=NONE
    hi ToolbarButton ctermbg=240 ctermfg=250 cterm=NONE
    hi Cursor ctermbg=242 ctermfg=NONE cterm=NONE
    hi CursorColumn ctermbg=236 ctermfg=NONE cterm=NONE
    hi CursorLineNr ctermbg=236 ctermfg=73 cterm=NONE
    hi CursorLine ctermbg=236 ctermfg=NONE cterm=NONE
    hi helpLeadBlank ctermbg=NONE ctermfg=NONE cterm=NONE
    hi helpNormal ctermbg=NONE ctermfg=NONE cterm=NONE
    hi StatusLine ctermbg=101 ctermfg=235 cterm=NONE
    hi StatusLineNC ctermbg=238 ctermfg=101 cterm=NONE
    hi StatusLineTerm ctermbg=101 ctermfg=235 cterm=NONE
    hi StatusLineTermNC ctermbg=238 ctermfg=101 cterm=NONE
    hi Visual ctermbg=235 ctermfg=110 cterm=reverse
    hi VisualNOS ctermbg=NONE ctermfg=NONE cterm=underline
    hi VertSplit ctermbg=238 ctermfg=238 cterm=NONE
    hi WildMenu ctermbg=110 ctermfg=235 cterm=NONE
    hi Function ctermbg=NONE ctermfg=229 cterm=NONE
    hi SpecialKey ctermbg=NONE ctermfg=240 cterm=NONE
    hi Title ctermbg=NONE ctermfg=231 cterm=NONE
    hi DiffAdd ctermbg=235 ctermfg=108 cterm=reverse
    hi DiffChange ctermbg=235 ctermfg=103 cterm=reverse
    hi DiffDelete ctermbg=235 ctermfg=131 cterm=reverse
    hi DiffText ctermbg=235 ctermfg=208 cterm=reverse
    hi IncSearch ctermbg=131 ctermfg=235 cterm=NONE
    hi Search ctermbg=229 ctermfg=235 cterm=NONE
    hi Directory ctermbg=NONE ctermfg=73 cterm=NONE
    hi debugPC ctermbg=67 ctermfg=NONE cterm=NONE
    hi debugBreakpoint ctermbg=131 ctermfg=NONE cterm=NONE
    hi SpellBad ctermbg=NONE ctermfg=131 cterm=undercurl
    hi SpellCap ctermbg=NONE ctermfg=73 cterm=undercurl
    hi SpellLocal ctermbg=NONE ctermfg=65 cterm=undercurl
    hi SpellRare ctermbg=NONE ctermfg=208 cterm=undercurl
    hi ColorColumn ctermbg=234 ctermfg=NONE cterm=NONE

elseif &t_Co == 8 || $TERM !~# '^linux' || &t_Co == 16
    set t_Co=16

    hi Normal ctermbg=bg ctermfg=fg cterm=NONE

    set background=dark

    hi NonText ctermbg=NONE ctermfg=darkgrey cterm=NONE
    hi EndOfBuffer ctermbg=NONE ctermfg=darkgrey cterm=NONE
    hi LineNr ctermbg=black ctermfg=lightgrey cterm=NONE
    hi FoldColumn ctermbg=black ctermfg=lightgrey cterm=NONE
    hi Folded ctermbg=black ctermfg=lightgrey cterm=NONE
    hi MatchParen ctermbg=black ctermfg=yellow cterm=NONE
    hi signColumn ctermbg=black ctermfg=lightgrey cterm=NONE
    hi Comment ctermbg=NONE ctermfg=darkgrey cterm=NONE
    hi Conceal ctermbg=NONE ctermfg=fg cterm=NONE
    hi Constant ctermbg=NONE ctermfg=red cterm=NONE
    hi Error ctermbg=NONE ctermfg=darkred cterm=reverse
    hi Identifier ctermbg=NONE ctermfg=darkblue cterm=NONE
    hi Ignore ctermbg=NONE ctermfg=NONE cterm=NONE
    hi PreProc ctermbg=NONE ctermfg=darkcyan cterm=NONE
    hi Special ctermbg=NONE ctermfg=darkgreen cterm=NONE
    hi Statement ctermbg=NONE ctermfg=blue cterm=NONE
    hi String ctermbg=NONE ctermfg=green cterm=NONE
    hi Todo ctermbg=NONE ctermfg=NONE cterm=reverse
    hi Type ctermbg=NONE ctermfg=magenta cterm=NONE
    hi Underlined ctermbg=NONE ctermfg=darkcyan cterm=underline
    hi Pmenu ctermbg=darkgrey ctermfg=fg cterm=NONE
    hi PmenuSbar ctermbg=darkgrey ctermfg=NONE cterm=NONE
    hi PmenuSel ctermbg=darkcyan ctermfg=bg cterm=NONE
    hi PmenuThumb ctermbg=darkcyan ctermfg=darkcyan cterm=NONE
    hi ErrorMsg ctermbg=darkred ctermfg=bg cterm=NONE
    hi ModeMsg ctermbg=green ctermfg=bg cterm=NONE
    hi MoreMsg ctermbg=NONE ctermfg=darkcyan cterm=NONE
    hi Question ctermbg=NONE ctermfg=green cterm=NONE
    hi WarningMsg ctermbg=NONE ctermfg=darkred cterm=NONE
    hi TabLine ctermbg=darkgrey ctermfg=darkyellow cterm=NONE
    hi TabLineFill ctermbg=darkgrey ctermfg=darkgrey cterm=NONE
    hi TabLineSel ctermbg=darkyellow ctermfg=bg cterm=NONE
    hi ToolbarLine ctermbg=black ctermfg=NONE cterm=NONE
    hi ToolbarButton ctermbg=darkgrey ctermfg=fg cterm=NONE
    hi Cursor ctermbg=lightgrey ctermfg=NONE cterm=NONE
    hi CursorColumn ctermbg=darkgrey ctermfg=NONE cterm=NONE
    hi CursorLineNr ctermbg=darkgrey ctermfg=cyan cterm=NONE
    hi CursorLine ctermbg=darkgrey ctermfg=NONE cterm=NONE
    hi helpLeadBlank ctermbg=NONE ctermfg=NONE cterm=NONE
    hi helpNormal ctermbg=NONE ctermfg=NONE cterm=NONE
    hi StatusLine ctermbg=darkyellow ctermfg=bg cterm=NONE
    hi StatusLineNC ctermbg=darkgrey ctermfg=darkyellow cterm=NONE
    hi StatusLineTerm ctermbg=darkyellow ctermfg=bg cterm=NONE
    hi StatusLineTermNC ctermbg=darkgrey ctermfg=darkyellow cterm=NONE
    hi Visual ctermbg=bg ctermfg=blue cterm=reverse
    hi VisualNOS ctermbg=NONE ctermfg=NONE cterm=underline
    hi VertSplit ctermbg=darkgrey ctermfg=darkgrey cterm=NONE
    hi WildMenu ctermbg=blue ctermfg=bg cterm=NONE
    hi Function ctermbg=NONE ctermfg=yellow cterm=NONE
    hi SpecialKey ctermbg=NONE ctermfg=darkgrey cterm=NONE
    hi Title ctermbg=NONE ctermfg=white cterm=NONE
    hi DiffAdd ctermbg=bg ctermfg=green cterm=reverse
    hi DiffChange ctermbg=bg ctermfg=magenta cterm=reverse
    hi DiffDelete ctermbg=bg ctermfg=darkred cterm=reverse
    hi DiffText ctermbg=bg ctermfg=red cterm=reverse
    hi IncSearch ctermbg=darkred ctermfg=bg cterm=NONE
    hi Search ctermbg=yellow ctermfg=bg cterm=NONE
    hi Directory ctermbg=NONE ctermfg=cyan cterm=NONE
    hi debugPC ctermbg=darkblue ctermfg=NONE cterm=NONE
    hi debugBreakpoint ctermbg=darkred ctermfg=NONE cterm=NONE
    hi SpellBad ctermbg=NONE ctermfg=darkred cterm=undercurl
    hi SpellCap ctermbg=NONE ctermfg=cyan cterm=undercurl
    hi SpellLocal ctermbg=NONE ctermfg=darkgreen cterm=undercurl
    hi SpellRare ctermbg=NONE ctermfg=red cterm=undercurl
    hi ColorColumn ctermbg=black ctermfg=NONE cterm=NONE
endif

hi link Terminal Normal
hi link Number Constant
hi link CursorIM Cursor
hi link Boolean Constant
hi link Character Constant
hi link Conditional Statement
hi link Debug Special
hi link Define PreProc
hi link Delimiter Special
hi link Exception Statement
hi link Float Number
hi link HelpCommand Statement
hi link HelpExample Statement
hi link Include PreProc
hi link Keyword Statement
hi link Label Statement
hi link Macro PreProc
hi link Number Constant
hi link Operator Statement
hi link PreCondit PreProc
hi link Repeat Statement
hi link SpecialChar Special
hi link SpecialComment Special
hi link StorageClass Type
hi link Structure Type
hi link Tag Special
hi link Terminal Normal
hi link Typedef Type
hi link htmlEndTag htmlTagName
hi link htmlLink Function
hi link htmlSpecialTagName htmlTagName
hi link htmlTag htmlTagName
hi link htmlBold Normal
hi link htmlItalic Normal
hi link xmlTag Statement
hi link xmlTagName Statement
hi link xmlEndTag Statement
hi link markdownItalic Preproc
hi link asciidocQuotedEmphasized Preproc
hi link diffBDiffer WarningMsg
hi link diffCommon WarningMsg
hi link diffDiffer WarningMsg
hi link diffIdentical WarningMsg
hi link diffIsA WarningMsg
hi link diffNoEOL WarningMsg
hi link diffOnly WarningMsg
hi link diffRemoved WarningMsg
hi link diffAdded String

let g:terminal_ansi_colors = [
    \ '#1c1c1c',
    \ '#af5f5f',
    \ '#5f875f',
    \ '#87875f',
    \ '#5f87af',
    \ '#5f5f87',
    \ '#5f8787',
    \ '#6c6c6c',
    \ '#444444',
    \ '#ff8700',
    \ '#87af87',
    \ '#ffffaf',
    \ '#8fafd7',
    \ '#8787af',
    \ '#5fafaf',
    \ '#ffffff',
\ ]
