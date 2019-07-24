set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Color column to indicate suggested max width
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

let g:syntastic_javascript_checkers = ['tslint']
