call pathogen#infect()

filetype plugin indent on
syntax on

runtime macros/matchit.vim

"""""""""""""""""""
" USEFUL DEFAULTS "
"""""""""""""""""""
augroup VIMRC
    autocmd!

    autocmd FocusLost * call autosave#AutoSave()

    autocmd VimEnter,GUIEnter * set visualbell t_vb=

    autocmd BufLeave * let b:winview = winsaveview()
    autocmd BufEnter * if exists('b:winview') | call winrestview(b:winview) | endif
augroup END

"""""""""""""""""""""""""""""""""
" ENVIRONMENT-SPECIFIC SETTINGS "
"""""""""""""""""""""""""""""""""
if !exists('os')
    if has('win32') || has('win16')
        let os = 'Windows'
    else
        let os = substitute(system('uname'), '\n', '', '')
    endif
endif

if !exists('myruntime')
    let myruntime = split(&rtp, ',')[0]
endif

if has('gui_running')
    set guioptions-=T
    set guioptions-=m

    if os == 'Darwin'
        set guifont=Fira\ Mono:h12
        set fuoptions=maxvert,maxhorz
        autocmd VIMRC GUIEnter * nnoremap <D-Left> gT|nnoremap <D-Right> gt
    elseif os == 'Linux'
        set guifont=Fira\ Mono\ 10
    elseif os == 'Windows'
        set encoding=utf-8
        set guifont=Fira_Mono:h10:cANSI
    endif
else
    if os == 'Windows'
        set encoding=utf-8
    endif

    if &term =~ '^screen'
        " tmux will send xterm-style keys when its xterm-keys option is on
        execute "set <xUp>=\e[1;*A"
        execute "set <xDown>=\e[1;*B"
        execute "set <xRight>=\e[1;*C"
        execute "set <xLeft>=\e[1;*D"
    endif

    " allows clicking after the 223rd column
    if has('mouse_sgr')
        set ttymouse=sgr
    endif

    nnoremap <Esc>A <up>
    nnoremap <Esc>B <down>
    nnoremap <Esc>C <right>
    nnoremap <Esc>D <left>
    inoremap <Esc>A <up>
    inoremap <Esc>B <down>
    inoremap <Esc>C <right>
    inoremap <Esc>D <left>
endif

""""""""""""""""""""
" GENERIC SETTINGS "
""""""""""""""""""""
" basic
set backspace=indent,eol,start
set hidden
set incsearch
set laststatus=2
set switchbuf=useopen,usetab
set tags=./tags;,tags;
set wildmenu

" fancy
set autoindent
set expandtab
set shiftround
set shiftwidth=4
set softtabstop=4
set smarttab

set gdefault
set ignorecase
set smartcase

set wildcharm=<C-z>
set wildignore+=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=*/min/*,*/vendor/*,*/node_modules/*,*/bower_components/*
set wildignore+=tags,cscope.*
set wildignore+=*.tar.*
set wildignorecase
set wildmode=full

set statusline=%<\ %f\ %m%r%y%w%=%l\/%-6L\ %3c\

set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

set foldlevelstart=999
set foldmethod=indent
set foldopen=hor,insert,jump,mark,percent,quickfix,search,tag,undo

set splitbelow
set splitright

set breakindent
set clipboard^=unnamed
set complete=.,w,b,u
set completeopt+=longest,menuone
set cursorline
set fileformats=unix,dos,mac
set formatoptions+=1
set hlsearch
set linebreak
set mouse=a
set nostartofline
set noswapfile
set nrformats-=octal
set path&
let &path .= "**"
set previewheight=1
set report=0
set sessionoptions+=resize
set sessionoptions+=winpos
set showbreak=›››\
set viewoptions-=options
set viminfo='33,<50,s10,h
set virtualedit=block

"""""""""""""""""
" PRETTY COLORS "
"""""""""""""""""
colorscheme apprentice

"""""""""""""""""""""""
" JUGGLING WITH FILES "
"""""""""""""""""""""""
nnoremap ,f :find *
nnoremap ,s :sfind *
nnoremap ,v :vert sfind *
nnoremap ,t :tabfind *
nnoremap ,F :find <C-R>=fnameescape(expand('%:p:h')).'/**/*'<CR>
nnoremap ,S :sfind <C-R>=fnameescape(expand('%:p:h')).'/**/*'<CR>
nnoremap ,V :vert sfind <C-R>=fnameescape(expand('%:p:h')).'/**/*'<CR>
nnoremap ,T :tabfind <C-R>=fnameescape(expand('%:p:h')).'/**/*'<CR>

"""""""""""""""""""""""""
" JUGGLING WITH BUFFERS "
"""""""""""""""""""""""""
nnoremap ,b :Buffer *
nnoremap ,B :sbuffer *

nnoremap <PageUp>   :bprevious<CR>
nnoremap <PageDown> :bnext<CR>

"""""""""""""""""""""""""
" JUGGLING WITH WINDOWS "
"""""""""""""""""""""""""
nnoremap <C-Down> <C-w>w
nnoremap <C-Up>   <C-w>W

"""""""""""""""""""""""
" JUGGLING WITH LINES "
"""""""""""""""""""""""
nnoremap <silent> ,<Up>   :<C-u>move-2<CR>==
nnoremap <silent> ,<Down> :<C-u>move+<CR>==
xnoremap <silent> ,<Up>   :move-2<CR>gv=gv
xnoremap <silent> ,<Down> :move'>+<CR>gv=gv

"""""""""""""""""""""""
" JUGGLING WITH WORDS "
"""""""""""""""""""""""
nnoremap ,<Left>  "_yiw?\v\w+\_W+%#<CR>:s/\v(%#\w+)(\_W+)(\w+)/\3\2\1/<CR><C-o><C-l>
nnoremap ,<Right> "_yiw:s/\v(%#\w+)(\_W+)(\w+)/\3\2\1/<CR><C-o>/\v\w+\_W+<CR><C-l>

"""""""""""""""""""""""""""""
" JUGGLING WITH COMPLETIONS "
"""""""""""""""""""""""""""""
inoremap ,, <C-x><C-o><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ",,"<CR>
inoremap ,; <C-n><C-r>=pumvisible()      ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ",;"<CR>
inoremap ,: <C-x><C-f><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ",:"<CR>
inoremap ,= <C-x><C-l><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ",="<CR>

""""""""""""""""""""""""""
" JUGGLING WITH SEARCHES "
""""""""""""""""""""""""""
nnoremap ,I :Ilist<Space>

command! -nargs=+ -complete=file_in_path -bar Grep  silent! grep! <args> | redraw!
command! -nargs=+ -complete=file_in_path -bar LGrep silent! lgrep! <args> | redraw!

nnoremap <silent> ,G :Grep <C-r><C-w><CR>
xnoremap <silent> ,G :<C-u>let cmd = "Grep " . visual#GetSelection() <bar>
                        \ call histadd("cmd", cmd) <bar>
                        \ execute cmd<CR>

if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column\ --vimgrep
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

"""""""""""""""""""""""""
" JUGGLING WITH MATCHES "
"""""""""""""""""""""""""
cnoremap <expr> <Tab>   getcmdtype() == "/" \|\| getcmdtype() == "?" ? "<CR>/<C-r>/" : "<C-z>"
cnoremap <expr> <S-Tab> getcmdtype() == "/" \|\| getcmdtype() == "?" ? "<CR>?<C-r>/" : "<S-Tab>"

""""""""""""""""""""""""""""""""
" JUGGLING WITH SEARCH/REPLACE "
""""""""""""""""""""""""""""""""

nnoremap <Space><Space> :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <Space>%       :%s/\<<C-r>=expand('<cword>')<CR>\>/

xnoremap <Space><Space> :<C-u>'{,'}s/<C-r>=visual#GetSelection()<CR>/
xnoremap <Space>%       :<C-u>%s/<C-r>=visual#GetSelection()<CR>/

"""""""""""""""""""""""""
" JUGGLING WITH CHANGES "
"""""""""""""""""""""""""
nnoremap ,; *``cgn
nnoremap ,, #``cgN

xnoremap ,; <Esc>:let @/ = visual#GetSelection()<CR>cgn
xnoremap ,, <Esc>:let @/ = visual#GetSelection()<CR>cgN

"""""""""""""""""""""""""""""
" JUGGLING WITH DEFINITIONS "
"""""""""""""""""""""""""""""
nnoremap ,j :tjump /
nnoremap ,p :ptjump /

nnoremap g] g<C-]>

nnoremap ,D :Dlist<Space>

"""""""""""""""""""""""""
" JUGGLING WITH NUMBERS "
"""""""""""""""""""""""""
xnoremap <silent> <C-a> :<C-u>let vcount = v:count1 <bar> '<,'>s/\%V\d\+/\=submatch(0) + vcount<cr>gv
xnoremap <silent> <C-x> :<C-u>let vcount = v:count1 <bar> '<,'>s/\%V\d\+/\=submatch(0) - vcount<cr>gv

xnoremap <silent> ,i :<C-u>let vcount = v:count<CR>gv:call incr#Incr(vcount)<CR>

""""""""""""""""""""""""""""""""
" BRACE EXPANSION ON THE CHEAP "
""""""""""""""""""""""""""""""""
inoremap (; (<CR>);<Esc>O
inoremap (, (<CR>),<Esc>O
inoremap {; {<CR>};<Esc>O
inoremap {, {<CR>},<Esc>O
inoremap [; [<CR>];<Esc>O
inoremap [, [<CR>],<Esc>O

""""""""""""""""""""
" VARIOUS MAPPINGS "
""""""""""""""""""""
nnoremap ,d "_d
xnoremap ,d "_d

xnoremap ,p "_dP

nnoremap Y y$

xnoremap > >gv
xnoremap < <gv

nnoremap ,<Space><Space> m`o<Esc>kO<Esc>``

nnoremap <expr> k      v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j      v:count == 0 ? 'gj' : 'j'
nnoremap <expr> <Up>   v:count == 0 ? 'gk' : 'k'
nnoremap <expr> <Down> v:count == 0 ? 'gj' : 'j'

nnoremap gV `[v`]

nnoremap ' `

nnoremap <BS> <C-^>

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-r>=icr#ICR()\<CR>"
cnoremap <expr> <CR> ccr#CCR()

cnoremap <C-a> <Home>
cnoremap <C-e> <End>

cnoremap %% <C-r>=fnameescape(expand('%'))<cr>
cnoremap :: <C-r>=fnameescape(expand('%:p:h'))<cr>/

cnoremap <C-r><C-l> <C-r>=getline('.')<CR>

cnoremap <C-k> <C-\>esplit(getcmdline(), " ")[0]<CR><Space>

"""""""""""""""""""""""
" CUSTOM TEXT-OBJECTS "
"""""""""""""""""""""""
for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '%', '-', '#' ]
    execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
    execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
    execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
    execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor

xnoremap in :<C-u>call visual#Numbers()<CR>
onoremap in :normal vin<CR>

xnoremap il g_o0
onoremap il :<C-u>normal vil<CR>
xnoremap al $o0
onoremap al :<C-u>normal val<CR>

""""""""""""""""""""
" VARIOUS COMMANDS "
""""""""""""""""""""
command! TU call tounix#ToUnix()

command! SS echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')

command! LCD lcd %:p:h
command! CD  cd %:p:h

command! -range=% TR let b:wv = winsaveview() | execute <line1> . ',' . <line2> . 's/\s\+$//' | call winrestview(b:wv)

command! EV tabedit $MYVIMRC <bar> lcd %:p:h
command! SV source  $MYVIMRC

" sharing is caring
command! -range=% SP  silent execute <line1> . "," . <line2> . "w !curl -F 'sprunge=<-' http://sprunge.us | tr -d '\\n' | pbcopy"
command! -range=% CL  silent execute <line1> . "," . <line2> . "w !curl -F 'clbin=<-' https://clbin.com | tr -d '\\n' | pbcopy"
command! -range=% VP  silent execute <line1> . "," . <line2> . "w !curl -F 'text=<-' http://vpaste.net | tr -d '\\n' | pbcopy"
command! -range=% IX  silent execute <line1> . "," . <line2> . "w !curl -F 'f:1=<-' ix.io | tr -d '\\n' | pbcopy"
command! -range=% TB  silent execute <line1> . "," . <line2> . "w !nc termbin 9999 | tr -d '\\n' | pbcopy"
command!          CMD let @+ = ':' . @:

command! SC vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile

"""""""""""""""""""
" PLUGIN SETTINGS "
"""""""""""""""""""
" snipmate
let g:snippets_dir = myruntime . '/snippets/'
imap ,<Tab> <C-r><Tab>

" netrw
let g:netrw_winsize   = '30'
let g:netrw_banner    = 0
let g:netrw_keepdir   = 1
let g:netrw_liststyle = 3

" built-in html-indent
let g:html_indent_script1 = 'inc'
let g:html_indent_style1  = 'inc'
let g:html_indent_inctags = 'html,body,head,tbody,p,li,dd,dt,h1,h2,h3,h4,h5,h6,blockquote,section'
let html_wrong_comments   = 1

" sparkup
let g:sparkup = myruntime . '/bundle/sparkup/ftplugin/html/sparkup.py'

" vim-qf
let g:qf_mapping_ack_style = 1
let g:qf_statusline        = {}
let g:qf_statusline.before = '%<\ '
let g:qf_statusline.after  = '\ %f%=%l\/%-6L\ \ \ \ \ '
nmap <Home>   <Plug>QfCprevious
nmap <End>    <Plug>QfCnext
nmap <C-Home> <Plug>QfLprevious
nmap <C-end>  <Plug>QfLnext
nmap ç        <Plug>QfSwitch
nmap <F5>     <Plug>QfCtoggle
nmap <F6>     <Plug>QfLtoggle
