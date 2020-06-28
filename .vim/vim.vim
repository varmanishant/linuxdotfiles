command! -nargs=1 Silent
    \ | execute ':silent !'.<q-args>
    \ | execute ':redraw!'

let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"

set viminfo=
