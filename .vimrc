" Vim-Plug
call plug#begin()
Plug 'preservim/NERDTree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/tagbar'
Plug 'tpope/vim-fugitive'
call plug#end()

" Default behavior
set wrap		   "Set deafult line wrapping
set mouse=a		   "Allow mouse
set number relativenumber  "Using hybrid numbering

" lightline behavior
set laststatus=2  "Show lightline status bar
set noshowmode	  "Turn off the default vim status bar
let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']],
      \   'right': [['lineinfo'], ['percent'], ['tagbar', 'fileformat', 'fileencoding', 'filetype']]
      \ },
      \ 'component_function': {
      \   'tagbar': 'lightline_tagbar#component',
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ }



