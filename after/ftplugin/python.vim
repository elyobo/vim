set nowrap " Do not wrap lines, python max length is more strict

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Color column to indicate suggested max width
if exists('+colorcolumn')
    " PEP 0008 - max width 79, comment/docblock width 72
    set colorcolumn=72,79
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
endif
