" Vim-Plug
call plug#begin()
Plug 'preservim/NERDTree'
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'felixhummel/setcolors.vim'
Plug 'jiangmiao/auto-pairs'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

" default colorscheme
colorscheme delek
set t_Co=256

" auto-pairs
" let g:AutoPairsMapBS = 0 " Do not pair delete (fuck up the comments for some languages like Python or Vim)

" deoplete config
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 

" default behavior
set wrap		   "Set deafult line wrapping
set mouse=a		   "Allow mouse
set number relativenumber  "Using hybrid numbering
set autoread		   "Load file change automatically
set tabstop=2
set shiftwidth=2

" vim-airline config
let g:airline_theme='base16_monokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#searchmethod = 'nearest-stl'

" clang high-lighing config
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_experimental_simple_template_highlight = 0

" automate building code
autocmd BufWritePost /home/dphan/Workspace/minos_std/NDresBin-2/plot_recoEspect_vs_y.C silent! execute "setup_root; root /home/dphan/Workspace/minos_std/NDresBin-2/plot_recoEspect_vs_y.C" | redraw!
