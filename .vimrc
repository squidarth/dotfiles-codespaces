" @squidarth's vimrc
" ==============
"
" You'll need to install Vundle (https://github.com/gmarik/vundle) before any of this will work.
" README: https://github.com/bengl/dotfiles/blob/master/README

" don't need vi compatibility mode
set nocompatible

" vundle stuff
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" vundle bundles
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/Conque-Shell'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-afterimage'
Bundle 'kchmck/vim-coffee-script'
Bundle 'anzaika/go.vim'
Bundle 'tpope/vim-endwise'
Bundle 'mutewinter/ir_black_mod'
Bundle 'godlygeek/csapprox'
Bundle 'Rykka/colorv.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'majutsushi/tagbar'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-ruby/vim-ruby'
Bundle 'L9'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/vimshell'
Bundle 'tpope/vim-markdown'
Bundle 'bling/vim-airline'
" plugins, indents, syntax, filetypes
filetype plugin indent on
syntax on

let g:ctrlp_map= '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

nmap <c-p> :CtrlP<CR>
" Control D to toggle NERDTree
nmap <silent> <C-D> :NERDTreeToggle<CR>

" F5 to toggle TagList
nmap <silent> <F5> :TagbarToggle<CR>

autocmd FileType ruby nmap db ibinding.pry
autocmd FileType javascript nmap db idebugger

map ` :tabnext<CR>

" cool ASCII arrows in NERDTree
let NERDTreeDirArrows=1

" tabs that make sense (and are 2 spaces)
set tabstop=4
set shiftwidth=4
set smartindent
set expandtab

" line numbers
set number

" syntax completion with Alt/Option-Space
set ofu=syntaxcomplete#Complete
imap <M-Space> <C-X><C-O>

" use mouse even in terminal
set mouse=a

" folding stuff (i rarely use this)
"set foldmethod=syntax

" super sexy searching
set incsearch
set hlsearch

" make backspace work like a friggin backspace in insert mode
set backspace=indent,eol,start

" best color scheme ever?
colorscheme ir_black_mod

" always show the status line
set laststatus=2

" force 256 colors (needed for powerline)
set t_Co=256

" make powerline look sexy
let g:Powerline_symbols='fancy'

" indent guides aren't annoying
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2

" allow modelines
set modeline
set modelines=3

" use system clipboard
set clipboard=unnamed

" epic vim command completion
set wildmenu

" persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" 80 char limit

" CtrlP options
let g:ctrlp_map = '<Leader>t'
nmap <silent> <Leader>tt :CtrlPTag<CR>
set wildignore+=.git/*
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files']

" enable neocomplcache
let g:neocomplcache_enable_at_startup = 1

" gui stuff
if has("gui_running")
  set guifont=Menlo\ Regular:h14 "this is actually Menlo with Powerline patch
  set guioptions-=T
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  set fuoptions=maxvert,maxhorz
  set background=dark
endif

" macvim stuff
if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
endif

match ErrorMsg '\s\+$'
