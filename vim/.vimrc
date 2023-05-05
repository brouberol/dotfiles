" Here are the list of online resources used to create this vimrc
" - http://dougblack.io/words/a-good-vimrc.html
" - https://danielmiessler.com/study/vim/

" ---- Vundle (plugin manager) ----
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
" call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" other plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'eapache/rainbow_parentheses.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'plasticboy/vim-markdown'
Plugin 'rafi/awesome-vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ---- UI config ----
set encoding=utf-8
set number  " show line numbers
set showcmd  " show command in bottom bar
set cursorline  " highlight current line
hi CursorLine term=bold cterm=bold
hi CursorLineNr   term=bold ctermfg=Yellow gui=bold guifg=Yellow
set wildmenu  " visual autocomplete for command menu
set lazyredraw  " redraw screen only when it needs to (often leading to faster macro exec)
set showmatch  " highlight matching [{()}]
set mouse=a  " activate mouse interactions
set ignorecase
inoremap jk <ESC>
" use 'jk' to escape from a mode
set wrap " wrap lines
set linebreak  " Do no break words when wrapping

" ---- colors ----
syntax enable  " enable syntax highlighting
colorscheme materialbox

" ---- rainbow parentheses config ----
" The last color in the list will be the first to be used
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
" always on
au VimEnter * RainbowParenthesesToggle
au VimEnter * RainbowParenthesesLoadRound
au VimEnter * RainbowParenthesesLoadSquare
au VimEnter * RainbowParenthesesLoadBraces

" ---- status bar ----
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode  " Status will be shown in the lightline status bar

" function counting number of words in markdown files
" Credit: https://gist.github.com/Integralist/00387caeb4d68bb0c0ef862c3de3459d
function! UpdateWordCount()
  let lnum = 1
  let n = 0
  while lnum <= line('$')
    let n = n + len(split(getline(lnum)))
    let lnum = lnum + 1
  endwhile
  let g:word_count = n . " words"
  return &filetype ==# 'markdown' ? g:word_count : ''
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'wordcount', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'wordcount': 'UpdateWordCount',
      \ },
      \ }


" ---- spaces and tabs -----
set tabstop=4  " number of visual spaces per tab
set expandtab  " expand tabs into spaces
set softtabstop=4  " number of spaces in tab when editing
set autoindent  " copy the indentation from the previous line on a newline
set shiftwidth=4 " when using the >> or << commands, shift lines by 4 spaces
autocmd BufWritePre <buffer> :%s/\s\+$//e  " Remove trailing spaces at save

" ---- searching ----
set incsearch  " search as characters are entered
set hlsearch  " highlight matches
set smartcase
nnoremap / /\v

" ---- folding ----
set foldenable  " enable folding
set foldlevelstart=10  " open most folds by default
set foldnestmax=10  " 10 nested fold max
set foldmethod=indent  " fold based on indent level
nnoremap <space> za  " fold/unfold using the spacebar

" ---- movement ----
set backspace=indent,eol,start

" enable all Python syntax highlighting features
autocmd BufRead,BufNewFile *.j2 set filetype=jinja

" ---- Split navigation ----
set splitbelow  " Open horizontal split below
set splitright  " Open vertical split on the right
nnoremap <C-[> :close<CR>
nnoremap <C-]> :vsplit<CR>
" Easier navigation by short cicuiting the C-w into a single Ctrl
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-l> <C-w>l
map <C-k> <C-w>k
