" Here are the list of online resources used to create this vimrc
" - http://dougblack.io/words/a-good-vimrc.html
" - https://danielmiessler.com/study/vim/

" ---- Vundle (plugin manager) ----
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" other plugins
" Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'eapache/rainbow_parentheses.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'itchyny/lightline.vim'
Plugin 'jiangmiao/auto-pairs'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ---- ultisnips config ----
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" ---- syntastic config ----
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 1
let g:syntastic_check_on_open = 1
let g:syntastic_python_flake8_args='--ignore=E501'

" ---- YouCompleteMe config ----
let g:ycm_autoclose_preview_window_after_completion=1

" ---- rainbow parentheses config ----
" The last color in the list will be the first to be used
let g:rbpt_colorpairs = [
    \ ['darkcyan',    'DarkOrchid3'],
    \ ['brown',       'SeaGreen3'],
    \ ['gray',        'firebrick3'],
    \ ['magenta',     'SeaGreen3'],
    \ ['cyan',        'DarkOrchid3'],
    \ ['darkred',     'firebrick3'],
    \ ['brown',       'RoyalBlue3'],
    \ ['darkblue',    'DarkOrchid3'],
    \ ['gray',        'firebrick3'],
    \ ['red',         'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkmagenta', 'SeaGreen3'],
    \ ['red',         'RoyalBlue3'],
    \ ['green',       'RoyalBlue3'],
    \ ['blue',        'DarkOrchid3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
" always on
au VimEnter * RainbowParenthesesToggle
au VimEnter * RainbowParenthesesLoadRound
au VimEnter * RainbowParenthesesLoadSquare
au VimEnter * RainbowParenthesesLoadBraces

" ---- colors ----
syntax enable  " enable syntax highlighting
colorscheme sonokai

" ---- UI config ----
set encoding=utf-8
set number  " show line numbers
set showcmd  " show command in bottom bar
set cursorline  " highlight current line
hi CursorLine term=bold cterm=bold
hi CursorLineNr   term=bold ctermfg=Yellow gui=bold guifg=Yellow
filetype indent on  " load filetype-specific indentation rules (stored in indent/<lang>.vim)
set wildmenu  " visual autocomplete for command menu
set lazyredraw  " redraw screen only when it needs to (often leading to faster macro exec)
set showmatch  " highlight matching [{()}]
nnoremap <space> za  " fold/unfold mapping
set mouse=a  " activate mouse interactions
" use 'jk' to escape from a mode
inoremap jk <ESC>

" ---- status bar ----
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode  " Status will be shown in the lightline status bar
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


" ---- spaces and tabs -----
set tabstop=4  " number of visual spaces per tab
set expandtab  " expand tabs into spaces
set softtabstop=4  " number of spaces in tab when editing
set autoindent  " indent when moving to the next line while writing code
set shiftwidth=4 " when using the >> or << commands, shift lines by 4 spaces
autocmd BufWritePre <buffer> :%s/\s\+$//e  " Remove trailing spaces at save
set showmatch  " show the matching part of the pair for [] {} and ()

" ---- searching ----
set incsearch  " search as characters are entered
set hlsearch  " highlight matches
set ignorecase
set smartcase
nnoremap / /\v
let g:ag_working_path_mode="r"  " make ag search start from project root, not cwd

" ---- folding ----
set foldenable  " enable folding
set foldlevelstart=10  " open most folds by default
set foldnestmax=10  " 10 nested fold max
set foldmethod=indent  " fold based on indent level

" ---- movement ----
" move vertically by visual line
nnoremap j gj
nnoremap k gk
set backspace=indent,eol,start

" enable all Python syntax highlighting features
autocmd BufRead,BufNewFile *.j2 set filetype=jinja

" ---- NerdTree ----
let NERDTreeIgnore = ['\.pyc$']  " hide pyc files
" Hit Ctrl-E to open the nerdtree tab
nmap <C-e> :NERDTreeTabsToggle<CR>
nmap <C-f> :NERDTreeFocusToggle<CR>
" Close vim if the only tab remanining is nerdree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ---- Pasting ----
set pastetoggle=<F2>
