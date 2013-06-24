set nocompatible " Disable old vi compatibility

" Enable pathogen for auto-modules
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Detect file types, type type config files and enable indentation 
filetype plugin indent on 
" Enable omni completion
set ofu=syntaxcomplete#Complete 

" Generic config
syntax on                               " Enable syntax highlighting
set fileencodings=utf-8,default,latin1  " Set file encoding priorities
set expandtab                           " use spaces, not tabs
set tabstop=4                           " tabstops of 4
set shiftwidth=4                        " indents of 4
set autoindent smartindent              " turn on auto/smart indenting
set smarttab                            " make <tab> and <backspace> smarter
set backspace=eol,start,indent          " allow backspacing over indent, eol, & start
set foldlevel=99                        " start with folds open
set wrap                                " Wrap lines
set linebreak                           " Only break in sane places
set nolist                              " Prevent list from breaking line breaks
set textwidth=0
set wrapmargin=0                      

" Set up the colour scheme
set background=dark
colorscheme solarized

" Disregard these files for wildcard matches
set wildignore=.git,.svn,*.swo,*.swp

" Autcompletion for a few file types
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
au BufRead,BufNewFile *.less set filetype=css

" Jump to most recent line in a file when opening
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" Generic key mapping
:nmap <leader>n :setlocal number!<CR>  " Toggle line numbers
:nmap <leader>o :set paste!<CR>        " Toggle paste mode
:nmap <C-e> :e#<CR>                    " Ctrl-e to toggle between last edited buffer and this one
:nmap <C-n> :bnext<CR>                 " Ctrl-n to jump to the next buffer
:nmap <C-p> :bprev<CR>                 " Ctrl-p to jump to the previous buffer
" List open buffers to quickly jump
:nnoremap <leader>l :ls<cr>:b<space>
" List recent files
:nmap ' :browse old<CR>

" Configure search behaviour
:set incsearch
:set ignorecase
:set smartcase
:set hlsearch
:nmap \q :nohlsearch<CR>

" Always go to the first line in git commit messages
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Nerdtree Settings
:nmap <leader>e :NERDTreeToggle<CR> " Toggle open on <leader>e

" CtrlP Settings
:let g:ctrlp_map = '<leader>t'                       " Open on <leader>t
:let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$' " Don't scan VCS directories
:let g:ctrlp_dotfiles = 0                            " Hide dotfiles
:let g:ctrlp_clear_cache_on_exit = 0                 " Keep cache between sessions
:let g:ctrlp_working_path_mode = 0                   " Disable project root detection
:let g:ctrlp_match_window_reversed = 0               " Show best match at the top, not the bottom
:nmap ; :CtrlPBuffer<CR>
:nmap <leader>r ::CtrlPMRU<CR>

" Powerline Settings
:set laststatus=2                          " Always show the statusline
:let g:Powerline_colorscheme='solarized16' " Use solarized colours
:let g:Powerline_symbols='unicode'         " Use unicode symbols

" PIV Configuration
:let g:DisableAutoPHPFolding = 1           " Disable auto folding of PHP classes/methods/etc

" Syntastic Configuration
:let g:syntastic_php_phpcs_args = '--report=csv --standard=Symfony2' " Force Symfony2 standard
:let g:syntastic_php_checkers=['php']                                 " Disable style checkers
:let g:syntastic_php_phpcs_args = '--report=csv --standard=Symfony2' " Force Symfony2 standard
