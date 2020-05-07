" BASIC SETUP:

set nocompatible

set number relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
set termguicolors
set clipboard=unnamedplus

augroup CursorLine "Removes cursorline on inactive windows, adds it again on focus
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

set cmdheight=2
set splitbelow splitright

filetype plugin on

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

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle', 'NERDTree'] }
Plug 'tpope/vim-sensible'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yegappan/mru'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'prettier/vim-prettier'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'SirVer/ultisnips'
"Plug 'mlaursen/vim-react-snippets'
Plug 'honza/vim-snippets'

" COLORS, THEMES, ETC
"Plug 'junegunn/seoul256.vim'
Plug 'arcticicestudio/nord-vim'
"Plug 'morhetz/gruvbox'
"Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'ajmwagar/vim-deus'
"Plug 'chase/focuspoint-vim'
"Plug 'kristijanhusak/vim-hybrid-material'

call plug#end()

" CoC stuff
let g:coc_global_extensions = [
      \ 'coc-tsserver'
      \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" NERDTree configuration
let NERDTreeWinPos="right"

function! SmartNERDTree()
  if @% == ""
    NERDTreeToggle
  else
    NERDTreeFind
  endif
endfun

" " " " " " " " " " " " " " " " " " "
" " " " " " " " " " " " " " " " " " "
" " " " " "  CUSTOM STUFF " " " " " "
" " " " " " " " " " " " " " " " " " "
" " " " " " " " " " " " " " " " " " "

" Visual customizations
"let g:seoul256_background = 234
let g:nord_cursor_line_number_background = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
colorscheme nord
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Enables use of nvim-colorizer
"lua require'colorizer'.setup {css;}
lua require 'colorizer'.setup { css = { css = true; }; 'javascript'; html = { mode = 'foreground'; } }
"lua require 'colorizer'.setup { '*'; '!vim'; }

" REMAPS
nnoremap <silent>     <F2>            :MRU<CR>
nnoremap <silent>     <F3>            :set hlsearch!<CR>
nnoremap <silent>     <leader>,       :call SmartNERDTree()<CR>
nnoremap <silent>     <leader>f       :<C-U>Files<CR>
nnoremap <silent>     <leader>b       :<C-U>Buffers<CR>
nnoremap              q:              <nop>
nnoremap              Q               <nop>
nmap                  <F1>            <nop>
inoremap              {               {}<Left>
inoremap              {<CR>           {<CR>}<Esc>O
inoremap              {{              {
inoremap              {}              {}


" ABBREVS
cnoreabbrev H vert bo h
cnoreabbrev cwd lcd %:p:h

" FILETYPE SPECIFIC THINGS
au BufReadPost,BufNewFile *.html,*.ejs hi link htmlEndTag htmlTag
autocmd FileType json syntax match Comment +\/\/.\+$+ " Corrects comment highlighting in .json files
