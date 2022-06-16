syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set ruler    
set relativenumber
set laststatus=2  " Always display the status line
set numberwidth=5

set background=dark

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

filetype plugin indent on

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" Multiple Plug commands can be written in a single line using | separators
call plug#begin('~/.vim/plugged')

"  git integrationa
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'alvan/vim-closetag'
Plug 'airblade/vim-gitgutter'
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'honza/vim-snippets'

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ap/vim-css-color'

Plug 'terryma/vim-expand-region'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'takac/vim-hardtime'

" prettier
Plug 'sbdchd/neoformat'

" Initialize plugin system
call plug#end()

colorscheme gruvbox

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader=" "

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
nnoremap <leader>rz :vertical resize 30 <CR>
nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>/ :split<CR>

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Search and replace
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" Fast CtrlP
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }


" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
