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
    " ctrl-p is a fuzzy file finder.
    Plug 'kien/ctrlp.vim'
    " airline is a better status line and a tab-bar for nvim.
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " gruvbox colorscheme. Seems to work the best for me.
    Plug 'morhetz/gruvbox'
    Plug 'joshdick/onedark.vim'
    Plug 'sheerun/vim-polyglot'
    " neomake is a code linting tool that runs in the background.
    Plug 'neomake/neomake'
    " Install emmet
    Plug 'mattn/emmet-vim'
    " CSS Support
    Plug 'cakebaker/scss-syntax.vim'
    " delete afterwords if no good
    Plug 'hdima/python-syntax'
    Plug 'hynek/vim-python-pep8-indent'
    " Comment stuff using gcc
    Plug 'tpope/vim-commentary'
    " auto close anything
    Plug 'townk/vim-autoclose'
    Plug 'Raimondi/delimitMate'
" }

" Initialize plugin system
call plug#end()
" Formatting

set showmatch
set number
set relativenumber
set textwidth=0
set list listchars=tab:>\ ,trail:-,eol:¬

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
        " let g:airline#extensions#tabline#left_sep = '<'
        " let g:airline#extensions#tabline#left_alt_sep = ''
        " let g:airline#extensions#tabline#right_sep = '>'
        " let g:airline#extensions#tabline#right_alt_sep = ''
        " let g:airline_left_sep = ''
        " let g:airline_left_alt_sep = ''
        " let g:airline_right_sep = ''
        " let g:airline_right_alt_sep = ''
        let g:airline_theme= 'onedark'
	let g:airline_powerline_fonts = 1
    " }
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
	let g:deoplete#file#enable_buffer_path = 1
	let g:deoplete#tag#cache_limit_size = 10000000
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
    	let g:python_host_prog = '/usr/bin/python'
	let g:python3_host_prog = '/usr/bin/python3'
    " }

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
" }
