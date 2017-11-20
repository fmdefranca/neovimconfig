" specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"  You will load your plugin here
"  Make sure you use single quotes
" Initialize plugin system

Plug 'tomtom/tcomment_vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-syntastic/syntastic'
Plug 'morhetz/gruvbox'
Plug 'MaxSt/FlatColor'
Plug 'w0ng/vim-hybrid'
Plug 'KabbAmine/yowish.vim'

" Plugins
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
" Jedi vim plugin
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
" airline is a better status line and a tab-bar for nvim.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" gruvbox colorscheme. Seems to work the best for me.
Plug 'joshdick/onedark.vim'
" Install emmet
Plug 'mattn/emmet-vim'
" CSS Support
Plug 'cakebaker/scss-syntax.vim'
" python plugins 
Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent'
Plug 'fisadev/vim-isort'
if has('python')
    " YAPF formatter for python
    Plug 'pignacio/vim-yapf-format'
endif
" Comment stuff using gcc
Plug 'tpope/vim-commentary'
" auto close anything
Plug 'townk/vim-autoclose'
Plug 'Raimondi/delimitMate'
" Generic programming support
Plug 'jakedouglas/exuberant-ctags'
Plug 'Shougo/neocomplcache.vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tobyS/vmustache'
Plug 'janko-m/vim-test'
Plug 'maksimr/vim-jsbeautify'
Plug 'vim-syntastic/syntastic'
Plug 'neomake/neomake'
Plug 'ervandew/supertab'
Plug 'mhinz/vim-signify'
" Git Support
Plug 'kablamo/vim-git-log'
Plug 'gregsexton/gitv'
call plug#end()
"end of vim plugins


let mapleader = ','
set showmatch
set number
set relativenumber
set textwidth=0
set list listchars=tab:>\ ,trail:-,eol:¬
set ruler
set ttimeoutlen=50
set encoding=utf-8
let python_highlight_all=1
filetype plugin on
filetype indent on
set hlsearch " highlight search results


" Absolute width of netrw window
let g:netrw_winsize = -28

" tree-vew
let g:netrw_liststyle = 3

" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'

" open file in a new tab
let g:netrw_browse_split =3

" Tcomment settings
" Leader C is the prefix for code related mappings
noremap <silent> <leader>cc :TComment<CR>

" Leader F is for file related mappîngs (open, browse...) 
nnoremap <silent> <Leader>f :CtrlP<CR>
nnoremap <silent> <Leader>fm :CtrlPMRU<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl B for buffer related mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>b :CtrlPBuffer<CR> " cycle between buffer
nnoremap <silent> <Leader>bb :bn<CR> "create (N)ew buffer
nnoremap <silent> <Leader>bd :bdelete<CR> "(D)elete the current buffer
nnoremap <silent> <Leader>bu :bunload<CR> "(U)nload the current buffer
nnoremap <silent> <Leader>bl :setnomodifiable<CR> " (L)ock the current buffer"

" Vim colour scheme
let g:solarized_contrast="high"
set background=dark
colorscheme yowish

" reloads .vimrc -- making all changes active
map <silent> <Leader>v :source ~/.config/nvim/init.vim<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'NVIM reloaded'"<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline
let g:lightline = { 'colorscheme': 'yowish', }
set laststatus=2
set noshowmode

set statusline+=%#warningmsg#                                   "syntastic
set statusline+=%{SyntasticStatuslineFlag()}                    "syntastic
set statusline+=%*                                              "syntastic

let g:syntastic_always_populate_loc_list = 1                    "syntastic
let g:syntastic_auto_loc_list = 1                               "syntastic
let g:syntastic_check_on_open = 1                               "syntastic
let g:syntastic_check_on_wq = 0                                 "syntastic

" Make backspaces work
set backspace=indent,eol,start

set autowrite

set listchars=tab:>.,trail:.,extends:#,nbsp:.
set smartcase
set ignorecase

inoremap jj <ESC>

" Abbreviations {
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q

" Map save to ctrl + s
nmap <c-s> :w<CR>
imap <c-s> <C-o>:w<CR>


" Settings from old init.vim
" Plugin Settings {
" Airline {
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme= 'onedark'
let g:airline_powerline_fonts = 1
" }
" Syntastic Configuration {
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatusLineFlag{}}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
" }
" Vim-UtilSnips Configuration
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.

" CtrlP {
" Open file menu
" nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
" nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
" nnoremap <Leader>f :CtrlPMRUFiles<CR>
" }
" neomake {
autocmd! BufWritePost * Neomake
nnoremap <Leader>l :lopen<CR>
" }
" auto indent on enter using delimitMate {
let g:delimitMate_expand_cr = 1
"}
" Auto completed deoplete{
let g:deoplete#enable_at_startup = 1
" }

" neomake {
let g:netrw_liststyle=3 " tree (change to 0 for thin)
let g:netrw_banner=0    " no banner
let g:netrw_altv=1      " open files on right
let g:netrw_winsize=80  " only use 20% screen for netrw
" FIXME: Preview opens to left and is very narrow
let g:netrw_preview=1   " open previews vertically
" }
" Jedi vim auto complete {
let g:python2_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
" }
" Python Indentation {
" au BufNewFile,BufRead *.py
" 			\set tabstop=4
" 			\set softtabstop=4
" 			\set shiftwidth=4
" 			\set textwidth=4
" 			\set expandtab
" 			\set autoindent
" 			\set fileformat=unix
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h BadWhitespace /\s\+$/
" }
" You Completeme settings {
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter ToToDefinitionElseDeclaration<CR>
" }
