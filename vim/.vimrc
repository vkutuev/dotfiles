" Base syntax highlighting
filetype plugin on
syntax on

set autoindent
set smartindent
set cindent

" Filetree
nnoremap <F2> :NERDTreeToggle<CR>

" File structure
nnoremap <F8> :TagbarToggle<CR>

" Buffers 
nnoremap <A-Left> :bprevious<CR>
nnoremap <A-Right> :bnext<CR>
" nnoremap <C-F4> :bdelete<CR>

" bufExplorer
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
nnoremap <F4> :BufExplorer<CR>

" Terminal
nnoremap <A-F12> :terminal<CR>

" Airline
let g:airline#extensions#tabline#enabled=1

:set listchars=eol:⏎,tab:-->,trail:·,extends:>,precedes:<
:set list

