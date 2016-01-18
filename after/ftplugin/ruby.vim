set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Incorrectly flags this when echoing variables
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}

" Color column to indicate suggested max width
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

