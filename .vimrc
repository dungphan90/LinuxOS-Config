" Vim-Plug
call plug#begin()
Plug 'preservim/NERDTree'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'flazz/vim-colorschemes'
Plug 'felixhummel/setcolors.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'shougo/neocomplete.vim'
call plug#end()

" default colorscheme
colorscheme delek
set t_Co=256

" default behavior
set wrap		   "Set deafult line wrapping
set mouse=a		   "Allow mouse
set number relativenumber  "Using hybrid numbering
set autoread		   "Load file change automatically
set tabstop=2
set shiftwidth=2

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


" clang high-lighing config
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_experimental_simple_template_highlight = 0


