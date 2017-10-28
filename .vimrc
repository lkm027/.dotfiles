call plug#begin('~/.vim/plugged')

" Functionality
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
" Plug 'valloric/youcompleteme'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'

" Appearance/Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim'

call plug#end()

set number              " Set numbers on sidebar
set background=dark     "

set shiftwidth=4        " #col inserted after enter
set expandtab           " tabs now equal spaces
set tabstop=4           " #spaces a tab equals
set autoindent          " starts cursor at prev indent
set smartindent         " inserts one extra level of indent

set showcmd             " Show last command in bottom bar
set cursorline          " highlight current line

set incsearch           " search as characters are enabled
set hlsearch            " highlight matches

set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='laederon'
"let g:airline_theme='solarized'

"RainbowParentheses
"  let g:rbpt_colorpairs = [
"      \ ['brown',       'RoyalBlue3' ],
"      \ ['Darkblue',    'SeaGreen3'  ],
"      \ ['darkgray',    'DarkOrchid3'],
"      \ ['darkgreen',   'firebrick3' ],
"      \ ['darkcyan',    'RoyalBlue3' ],
"      \ ['darkred',     'SeaGreen3'  ],
"      \ ['darkmagenta', 'DarkOrchid3'],
"      \ ['brown',       'firebrick3' ],
"      \ ['gray',        'RoyalBlue3' ],
"      \ ['black',       'SeaGreen3'  ],
"      \ ['darkmagenta', 'DarkOrchid3'],
"      \ ['darkgreen',   'RoyalBlue3' ],
"      \ ['darkcyan',    'SeaGreen3'  ],
"      \ ['darkred',     'DarkOrchid3'],
"      \ ['red',         'firebrick3' ],
"      \ ]
"let g:rbpt_max = 16
"let g:rbpt_loadcmd_toggle = 0
"
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
"au Syntax * RainbowParenthesesLoadChevrons
"

highlight Comment ctermfg=Cyan
highlight Comment cterm=bold
highlight MatchParen ctermbg=DarkRed

" this next line is needed to enable your custom colors:
syntax enable
set pastetoggle=<F12>

" turn off past mode when leaving insert mode
au InsertLeave * set nopaste

  " EasyAlign
  vmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
  let g:easy_align_delimiters =
      \ {
      \ 's': {
      \       'pattern': 'C[a-z]',
      \       'left_margin': 1,
      \       'right_margin': 0,
      \       'align': 'r'
      \   },
      \ '{': {
      \       'pattern':      '[}]',
      \       'left_margin':  0,
      \       'right_margin': 0,
      \       'stick_to_left':0
      \   },
      \ '}': {
      \       'pattern':      '[}]',
      \       'left_margin':  1,
      \       'right_margin': 0,
      \       'stick_to_left':0
      \   },
      \ '[': {
      \       'pattern':       ']',
      \       'left_margin':   0,
      \       'right_margin':  0,
      \       'stick_to_left': 0
      \      },
      \ ']': {
      \       'pattern':       ']',
      \       'left_margin':   1,
      \       'right_margin':  0,
      \       'stick_to_left': 0
      \      },
      \ '(': {
      \       'pattern':       ')',
      \       'left_margin':   0,
      \       'right_margin':  0,
      \       'stick_to_left': 0
      \      },
      \ ')': {
      \       'pattern':       ')',
      \       'left_margin':   1,
      \       'right_margin':  0,
      \       'stick_to_left': 0
      \      },
      \ '<': {
      \       'pattern':       '<',
      \       'left_margin':   0,
      \       'right_margin':  0,
      \       'stick_to_left': 0
      \      },
      \ '?': {
      \       'pattern':       '[?]',
      \       'left_margin':   0,
      \       'right_margin':  0,
      \       'indentation':   's',
      \       'align':         'l'
      \      },
      \ ':': {
      \       'pattern':       ':',
      \       'left_margin':   1,
      \       'right_margin':  1,
      \       'stick_to_left': 0
      \      },
      \ '>': {
      \       'pattern':       '<',
      \       'left_margin':   1,
      \       'right_margin':  0,
      \       'stick_to_left': 0
      \      },
      \ }


