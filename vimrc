runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Detect file types, type type config files and enable indentation 
filetype plugin indent on 
" Enable omni completion
set ofu=syntaxcomplete#Complete 

syn on
set fileencodings=utf-8,default,latin1
set expandtab                           " use spaces, not tabs
set tabstop=4                           " tabstops of 8
set shiftwidth=4                        " indents of 8
set autoindent smartindent              " turn on auto/smart indenting
set smarttab                            " make <tab> and <backspace> smarter
set backspace=eol,start,indent          " allow backspacing over indent, eol, & start

" Set up the colour scheme
set background=dark
colorscheme solarized

" Disregard these files for wildcard matches
set wildignore=.git,.svn,*.swo,*.swp

" Nedtree
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

" Autcomplete... @todo figure out usage
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Additional file type mappings
au BufRead,BufNewFile *.tpl set filetype=php
au BufRead,BufNewFile *.twig set syntax=htmljinja
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.module set filetype=php
au BufRead,BufNewFile *.install set filetype=php
au BufRead,BufNewFile *.md set filetype=markdown

" Key mapping
:nmap \l :setlocal number!<CR>
:nmap \o :set paste!<CR>

