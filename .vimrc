call plug#begin('~/.vim/plugged')

" Functionality
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'

" Appearance/Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim'
Plug 'flazz/vim-colorschemes'
Plug 'jaredgorski/spacecamp'

Plug 'vim-syntastic/syntastic'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Vdebug
Plug 'joonty/vdebug'

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
set bs=2
set tabpagemax=100

" Appearance
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1
colorscheme spacecamp

highlight Comment ctermfg=Cyan
highlight Comment cterm=bold

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

set undofile " Maintain undo history between sessions
set undodir=~/.dotfiles/undodir

" Ruby File Spacing
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" Vdebug config
" Prevents Vdebug from automatically breaking on first line of PHP execution (router.php in our case)
let g:vdebug_options = {
\    'break_on_open' : 0,
\    'continuous_mode' : 0,
\}

" virtual machine settings
if substitute( system( 'hostname' ), '\n', '', '' ) == 'lucas.internal'
    " Syntastic
    source /etc/profile.d/vimrc/plugins/syntastic.vim

    " Syntastic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_mode="active"
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list            = 1
    let g:syntastic_check_on_open            = 1
    let g:syntastic_auto_jump                = 3
    let g:syntastic_check_on_wq              = 0
    let g:syntastic_auto_jump                = 1
    let g:syntastic_error_symbol             = "✗"
    let g:syntastic_style_error_symbol       = "✗"
    let g:syntastic_warning_symbol           = "⚠"
    let g:syntastic_style_warning_symbol     = "⚠"
    let g:syntastic_typescript_checkers      = ["tslint"]
    let g:syntastic_typescript_tslint_args   = "--config ~/.tslint.json"
    let g:syntastic_mode_map = {
      \ "mode": "passive",
      \ "active_filetypes": ["typescript"] }
    let g:syntastic_eruby_ruby_quiet_messages =
      \ {'regex': 'possibly useless use of a variable in void context'}

    au Filetype javascript let g:syntastic_aggregate_errors=1
    au Filetype php let g:syntastic_aggregate_errors=0
    au Filetype perl let g:syntastic_aggregate_errors=0
    au Filetype perl nnoremap <silent> <F7> :call PerlTidy()<CR>

" Local
else
    au BufRead,BufNewFile,BufEnter /home/lucas/SportsAreCool/* setlocal ts=2 sts=2 sw=2
endif
