"           _                    
"    _   __(_)___ ___  __________
"   | | / / / __ `__ \/ ___/ ___/
"  _| |/ / / / / / / / /  / /__  
" (_)___/_/_/ /_/ /_/_/   \___/  

" Disables automatic commenting on newline
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" FILETYPE SPECIFIC THINGS
au BufReadPost,BufNewFile *.html,*.ejs hi link htmlEndTag htmlTag
autocmd FileType json syntax match Comment +\/\/.\+$+ " Corrects comment highlighting in .json files
