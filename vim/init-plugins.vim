"------------------------------------
" load all plug-ins
"------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'aserebryakov/vim-todo-lists'
Plug 'godlygeek/tabular'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'groenewege/vim-less'
Plug 'Yggdroot/indentLine'
Plug 'cespare/vim-toml'
Plug 'ntpeters/vim-better-whitespace'
Plug 'elzr/vim-json'
Plug 'airblade/vim-gitgutter'
Plug 'hynek/vim-python-pep8-indent'
Plug 'mg979/vim-visual-multi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-sensible'
Plug 'chr4/nginx.vim'
Plug 'tpope/vim-git'
Plug 'plasticboy/vim-markdown'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-surround'
call plug#end()

colorscheme gruvbox
" Todo list plugin, don't move items.
let g:VimTodoListsMoveItems = 0
" open NERDTree
noremap <space>nn :NERDTree<cr>
