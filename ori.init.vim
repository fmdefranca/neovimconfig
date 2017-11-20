" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Plugins {
    " Insteall Deoplete
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
    " ctrl-p is a fuzzy file finder.
    Plug 'kien/ctrlp.vim'
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
    Plug 'tomtom/tcomment_vim'
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
" }

" Initialize plugin system
call plug#end()
" Formatting

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

" Enable Folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" No beeps or flashes
set novisualbell
set noerrorbells

" General Config
let g:mapleader = ","
let g:enable_bold_font = 1
let g:enable_italic_font = 1 

set gcr=a:blinkon500-blinkwait500-blinkoff500
set cursorline
" Yank to the end of the line
nnoremap Y y$
" Styling
syntax on
set termguicolors
colorscheme onedark



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
        nnoremap <Leader>o :CtrlP<CR>
        " Open buffer menu
        nnoremap <Leader>b :CtrlPBuffer<CR>
        " Open most recently used files
        nnoremap <Leader>f :CtrlPMRUFiles<CR>
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
   " " }

    " Abbreviations {

	cnoreabbrev Wq wq
	cnoreabbrev WQ wq
	cnoreabbrev W w
	cnoreabbrev Q q
	cnoreabbrev Qa qa
	cnoreabbrev Bd bd
	cnoreabbrev bD bd
	cnoreabbrev wrap set wrap
	cnoreabbrev nowrap set nowrap
	cnoreabbrev bda BufOnly
	cnoreabbrev t tabe
	cnoreabbrev T tabe
	cnoreabbrev f find
	cnoreabbrev F find
      " }

      " Custom bindings {
      	" Comment Map
	nmap <leader>c gcc
	" line comment commane
	xmap <leader>c gc
      
	" Map save to ctrl + s
	nmap <c-s> :w<CR>
	imap <c-s> <C-o>:w<CR>
	" Also save with leader (,)w
	nnoremap <leader>w :w<CR>
	"Move selected lines up and down
	vnoremap J :m '>+1<CR>gv=gv'
	vnoremap K :m '<-2<CR>gv=gv'		
      " }
      " Python run files {
      	map <F9> :w<CR>:!python %<CR>
      " }
      " SimplyFold options {
      "
     " }
     " shift cr to open new line {
     	nnoremap <S-CR> o
	inoremap <S-CR> o
     " }
      " You Completeme settings {
       let g:ycm_autoclose_preview_window_after_completion=1
       map <leader>g :YcmCompleter ToToDefinitionElseDeclaration<CR>
       " }

