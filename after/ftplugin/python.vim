set nowrap " Do not wrap lines, pythong max length is more strict

" Color column to indicate suggested max width
if exists('+colorcolumn')
    " PEP 0008 - max width 79, comment/docblock width 72
    set colorcolumn=72,79
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
endif
