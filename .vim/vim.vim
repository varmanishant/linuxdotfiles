command! -nargs=1 Silent
            \ | execute ':silent !'.<q-args>
            \ | execute ':redraw!'

"TODO Clear ~/.viminfo

set viminfo=
