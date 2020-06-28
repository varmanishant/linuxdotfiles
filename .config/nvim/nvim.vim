command! -nargs=1 Silent
    \ | execute ':silent terminal '.<q-args>
    \ | execute ':redraw!'

set shada="none"

au TermOpen * startinsert

"TODO Clear ~/.local/share/nvim/shada/main.shada

tnoremap <ESC> <C-\><C-N>:bd!<CR>
