" @squidarth's vimrc
" ==============
"
" You'll need to install Vundle (https://github.com/gmarik/vundle) before any of this will work.
" README: https://github.com/squidarth/dotfiles/blob/master/README

" don't need vi compatibility mode
set nocompatible

call plug#begin()
Plug 'gmarik/vundle'

" vundle bundles
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-afterimage'
Plug 'kchmck/vim-coffee-script'
Plug 'anzaika/go.vim'
Plug 'tpope/vim-endwise'
Plug 'mutewinter/ir_black_mod'
Plug 'godlygeek/csapprox'
Plug 'Rykka/colorv.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-ruby/vim-ruby'
Plug 'L9'
" Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'davidhalter/jedi-vim'
Plug 'rust-lang/rust.vim'
Plug 'lambdatoast/elm.vim'
Plug 'bling/vim-airline'
Plug 'thoughtbot/vim-rspec'
Plug 'jgdavey/tslime.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-abolish'
Plug 'benmills/vimux'
" Plug "ervandew/supertab"
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'terryma/vim-multiple-cursors'
" Bundle 'Shougo/neocomplete.vim'
" let $PATH = '/usr/local/bin:'.$PATH
call plug#end()
" Enable airline buffer listings.
let g:airline#extensions#tabline#enabled = 1
let mapleader = "\<Space>"

let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>
set re=1
let g:rspec_command = 'call Send_to_Tmux("./bin/rspec {spec}\n")'

" Dealing with buffers more easily
" Close buffers with leaderbq
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>q :qall<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>l :bnext<CR>
nmap <leader>bl :ls<CR>

nnoremap <leader>s :w<CR>
nnoremap <leader>p :Tags<CR>
imap jj <ESC>
autocmd FileType javascript map <Leader>rf :call VimuxRunCommand("clear; ./dev-scripts/karma-run-line-number.sh " . expand("%.") . ":" . line("."))<CR>
autocmd FileType javascript map <Leader>ra :call VimuxRunCommand("clear; $NODE_PATH/karma/bin/karma run")<CR>

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

autocmd FileType ruby,javascript autocmd BufWritePre <buffer> %s/\s\+$//e


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

let g:jsx_ext_required = 0

" plugins, indents, syntax, filetypes
filetype plugin indent on
syntax on
let g:SuperTabDefaultCompletionType = '<c-n>'
"let g:ctrlp_map= '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'

nmap <c-p> :FZF<CR>
" Control D to toggle NERDTree
nmap <silent> <C-D> :NERDTreeToggle<CR>

" F5 to toggle TagList
nmap <silent> <F5> :TagbarToggle<CR>

" cool ASCII arrows in NERDTree
let NERDTreeDirArrows=1

" tabs that make sense (and are 2 spaces)
set tabstop=2
set shiftwidth=2
set smartindent
set expandtab

" line numbers
set number
set relativenumber

" syntax completion with Alt/Option-Space
set ofu=syntaxcomplete#Complete
imap <M-Space> <C-X><C-O>

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

" CtrlP options
set wildignore+=.git/*
" let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files']

" enable neocomplete
let g:acp_enableAtStartup = 0
"let g:neocomplete#enable_at_startup = 1
"
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType ruby setlocal omnifunc=rubycomplete#CompleteTags


match ErrorMsg '\s\+$'

" Vim-abolish lines
au bufenter * Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or}  {despe,sepa}rat{}
au bufenter * Abolish {ocur}ence{s,} {occurr}ence{}
au bufenter * Abolish {dashbao}rd {dashboa}rd
au bufenter * Abolish {privel}ege {privil}ege
