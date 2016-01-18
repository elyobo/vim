set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Color column to indicate suggested max width
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

