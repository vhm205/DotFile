set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Color Scheme
Plugin 'mhartington/oceanic-next'

" Auto complete
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" Support write git command in vim
Plugin 'tpope/vim-fugitive'

" Badge Status Mode In Vim
Plugin 'itchyny/lightline.vim'

" Tree explorer
Plugin 'preservim/nerdtree'

" Search File
Plugin 'ctrlpvim/ctrlp.vim'

" Show git status in nerdtree
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Show icon file in nerdtree
Plugin 'ryanoasis/vim-devicons'

" Multiple Cursor
Plugin 'terryma/vim-multiple-cursors'

" For Typescript
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'

" For JS, JSX
" Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'maxmellon/vim-jsx-pretty'

" Comment code
Plugin 'tpope/vim-commentary'
" Plugin 'suy/vim-context-commentstring'

" Auto close tag (HTML)
Plugin 'alvan/vim-closetag'

" Expand selection (Ex: () "" {})
Plugin 'terryma/vim-expand-region'

" Auto close character (Ex: " ' [ {)
Plugin 'jiangmiao/auto-pairs'

call vundle#end()       

filetype plugin indent on
syntax on

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" set background=dark
" colorscheme iceberg

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
set autoread
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

" Map leader to <space>
" let mapleader = " "

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" Nerdtree git status
let g:NERDTreeGitStatusUseNerdFonts = 1
let NERDTreeShowHidden=1

" Multiple Cursor
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_select_all_word_key = '<C-a>'

" Coc nvim
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

" Map switch between windows
"nore <silent> <C-K> :wincmd k<CR>
"nore <silent> <C-J> :wincmd j<CR>
"nore <silent> <C-H> :wincmd h<CR>
"nore <silent> <C-L> :wincmd l<CR>

" NERD Tree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

""" COC.NVIM
nnoremap <silent> K :call CocAction('doHover')<CR>
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()
""" END COC.NVIM

" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

autocmd FileType apache setlocal commentstring=#\ %s

" autocmd FileType jsx setlocal commentstring={/*\ %s\ */}
" autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx
" autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}

if exists('g:context#commentstring#comments_table')
  let g:context#commentstring#table['javascript.jsx'] = {
              \ 'jsComment' : '// %s',
              \ 'jsImport' : '// %s',
              \ 'jsxStatment' : '// %s',
              \ 'jsxRegion' : '{/*%s*/}',
\}
endif

" Sync
" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Set transparent bg
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
"hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#E06C75
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66

" Custom Mapping
nmap <leader>tt :below vertical terminal<CR>

" resize current buffer by +/- 5
nnoremap <S-Left> :vertical resize +5<cr>
nnoremap <S-Down> :resize +5<cr>
nnoremap <S-Up> :resize -5<cr>
nnoremap <S-Right> :vertical resize -5<cr>
