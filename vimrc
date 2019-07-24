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
set fileencodings=utf-8,iso8859-11,default,latin1  " Set file encoding priorities
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

" Store backup/swap files somewhere less annoying
set backupdir=~/.vimdata/backup//
set directory=~/.vimdata/swp//

" Resize panes on window resize
:autocmd VimResized * wincmd =

" Set up the colour scheme
set background=dark
" :let g:solarized_visibility="high"
" :let g:solarized_termtrans=1
" colorscheme solarized
set t_Co=256
" let g:sublimemonokai_term_italic = 1
" colorscheme sublimemonokai
let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty

" Disregard these files for wildcard matches
set wildignore=.git,.svn,*.swo,*.swp
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
command! What echo synIDattr(synID(line('.'), col('.'), 1), 'name')

" Allow JSX in JS files
let g:jsx_ext_required = 0

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
au BufRead,BufNewFile *.phtml set filetype=php
au BufRead,BufNewFile *.twig set syntax=htmljinja
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.module set filetype=php
au BufRead,BufNewFile *.install set filetype=php
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.less set filetype=css
au BufRead,BufNewFile *.json set filetype=json

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

" 'vintage' case statement indentation
:let g:PHP_vintage_case_default_indent = 1

" CtrlP Settings
:let g:ctrlp_map = '<leader>t'                       " Open on <leader>t
:let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$' " Don't scan VCS directories
:let g:ctrlp_dotfiles = 0                            " Hide dotfiles
:let g:ctrlp_clear_cache_on_exit = 0                 " Keep cache between sessions
:let g:ctrlp_working_path_mode = 0                   " Disable project root detection
:let g:ctrlp_match_window_reversed = 0               " Show best match at the top, not the bottom
:nmap ; :CtrlPBuffer<CR>
:nmap <leader>r ::CtrlPMRU<CR>

" Limit mouse integration
set mouse=

" Powerline Settings
" :set laststatus=2                          " Always show the statusline
" :let g:Powerline_colorscheme='solarized16' " Use solarized colours
" :let g:Powerline_symbols='unicode'         " Use unicode symbols

" PIV Configuration
:let g:DisableAutoPHPFolding = 1           " Disable auto folding of PHP classes/methods/etc

" Syntastic Configuration
:let g:syntastic_php_phpcs_args = '--report=csv --standard=Symfony2' " Force Symfony2 standard
:let g:syntastic_php_checkers=['php']                                 " Disable style checkers
:let g:syntastic_php_phpcs_args = '--report=csv --standard=Symfony2' " Force Symfony2 standard
:let g:syntastic_json_checkers=['jsonlint']

" Vim file selection tab completion
set wildmode=longest,list,full
set wildmenu

" Vdebug settings
:let g:vdebug_options = { 'port' : '9090' }

" "Shell" command for opening shell output into a scratch buffer
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

hi Normal ctermbg=NONE guibg=NONE
hi Comment cterm=italic gui=italic
