" BASIC SETUP:

" Enter the current millennium
set nocompatible

" Some basics
set number relativenumber
set tabstop=2
set shiftwidth=2
set expandtab

set cmdheight=2
set splitbelow splitright

" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu
set wildmode=longest,list,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" PLUGINS "
call plug#begin(stdpath('data') . '/plugged')

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
Plug 'tpope/vim-sensible'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yegappan/mru'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" COLORS, THEMES, ETC
Plug 'junegunn/seoul256.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

call plug#end()

" " " " " " " " " " " " " " " " " " " " 
" " " " " " " " " " " " " " " " " " " " 
" " " " " "  CUSTOM STUFF " " " " " " " 
" " " " " " " " " " " " " " " " " " " " 
" " " " " " " " " " " " " " " " " " " " 

" Visual customizations
colorscheme gruvbox
let g:airline_powerline_fonts = 1
let g:airline_theme='angr'

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" REMAPS
nnoremap <F2> :MRU<CR>
nnoremap <F3> :set hlsearch!<CR>
nnoremap <silent> <leader>, :<C-U>NERDTreeFind<CR>
nnoremap <silent> <leader>f :<C-U>Files<CR>
nnoremap <silent> <leader>b :<C-U>Buffers<CR>

" ABBREVS
cnoreabbrev H vert bo h
