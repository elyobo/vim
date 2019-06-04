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

let g:syntastic_javascript_checkers = ['eslint']


" Colours copied from bundle/vim-monokai-tasty/colors/vim-monokai-tasty.vim
let s:italic = { "cterm": "italic", "gui": "italic" }

let s:yellow = { "cterm": 228, "gui": "#ffff87" }
let s:purple = { "cterm": 141, "gui": "#af87ff" }
let s:light_green = { "cterm": 148, "gui": "#A4E400" }
let s:light_blue = { "cterm": 81, "gui": "#62D8F1" }
let s:magenta = { "cterm": 197, "gui": "#FC1A70" }
let s:orange = { "cterm": 208, "gui": "#FF9700" }

" in order light -> dark
let s:white = { "cterm": 231, "gui": "#ffffff" }
let s:light_grey = { "cterm": 250, "gui": "#bcbcbc" }
let s:grey = { "cterm": 245, "gui": "#8a8a8a" }
let s:dark_grey = { "cterm": 59, "gui": "#5f5f5f" }
let s:darker_grey = { "cterm": 238, "gui": "#444444" }
let s:light_charcoal = { "cterm": 238, "gui": "#292929" }
let s:charcoal = { "cterm": 235, "gui": "#262626" }

let s:danger = { "cterm": 197, "gui": "#ff005f" }
let s:olive = { "cterm": 64, "gui": "#5f8700" }
let s:dark_red = { "cterm": 88, "gui": "#870000" }
let s:blood_red = { "cterm": 52, "gui": "#5f0000" }
let s:dark_green = { "cterm": 22, "gui": "#005f00" }
let s:light_sea_blue = { "cterm": 33, "gui": "#0087ff" }
let s:sea_blue = { "cterm": 25, "gui": "#005faf" }

let s:none = { "cterm": "NONE", "gui": "NONE" }
let s:bold = { "cterm": "bold", "gui": "bold" }
let s:underline = { "cterm": "underline", "gui": "underline" }
let s:bold_underline = { "cterm": "bold,underline", "gui": "bold,underline" }

" Match destructuring braces colour with destructuring assignment colour
call Highlight("jsDestructuringBraces", s:grey, s:none, s:none)
call Highlight("jsDestructuringAssignment", s:grey, s:none, s:none)

" Match func call parens colour with func call colour
call Highlight("jsParens", s:light_blue, s:none, s:none)
call Highlight("jsFuncCall", s:light_blue, s:none, s:none)

" Green italic strings please
call Highlight("jsString", s:light_green, s:none, s:italic)
call Highlight("jsTemplateString", s:light_green, s:none, s:italic)
" And reduce visibility of the ${} in template strings, the variable stands out
call Highlight("jsTemplateBraces", s:olive, s:none, s:none)

" Switch const/let/var to not have the same colour as function calls
call Highlight("jsStorageClass", s:yellow, s:none, s:italic)

" Make node glob and other globals the same
call Highlight("jsGlobalObjects", s:magenta, s:none, s:none)
