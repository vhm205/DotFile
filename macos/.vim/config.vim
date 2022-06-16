if (has("termguicolors"))
  set termguicolors
endif
  
colorscheme OceanicNext

set encoding=UTF-8
set number
set laststatus=2
set noshowmode
set showcmd
set tabstop=8
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

set smartcase
set nowrap
set scrolloff=4
" set backspace=indent,eol,start
set mouse=a
set ruler
set hlsearch
set noswapfile
set relativenumber
set cursorline

" Plugin
set undodir=~/.vim/undodir
set runtimepath^=~/.vim/bundle/ctrlp.vim

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
