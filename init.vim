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

call plug#end()

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
