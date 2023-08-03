filetype off                  " required

" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Color Scheme
" Plugin 'mhartington/oceanic-next'
" Plugin 'rakr/vim-one'
" Plugin 'drewtempelmeyer/palenight.vim'

Plugin 'sainnhe/everforest'

" Auto complete
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" Find file (coc extension)
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Support write git command in vim
Plugin 'tpope/vim-fugitive'

" Show git content change
Plugin 'airblade/vim-gitgutter'

" Support GraphQL
Plugin 'jparise/vim-graphql'

" Badge Status Mode In Vim
Plugin 'itchyny/lightline.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

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
Plugin 'mxw/vim-jsx'
Plugin 'maxmellon/vim-jsx-pretty'

" Comment code
Plugin 'tpope/vim-commentary'

" Auto close tag (HTML)
Plugin 'alvan/vim-closetag'

" Expand selection (Ex: () "" {})
Plugin 'terryma/vim-expand-region'

" Auto close character (Ex: " ' [ {)
Plugin 'jiangmiao/auto-pairs'

" Live server HTML
" Plugin 'turbio/bracey.vim'

" ESlint
Plugin 'neoclide/coc-eslint'

" Motion Speed <3
Plugin 'easymotion/vim-easymotion'

" REST api
Plugin 'diepm/vim-rest-console'

Plugin 'wakatime/vim-wakatime'

" Wrap content in [], {}, "", ''
Plugin 'tpope/vim-surround'

" Plugin 'morhetz/gruvbox'

" AI suggest complete
Plugin 'Exafunction/codeium.vim'

" Debuger
Plugin 'puremourning/vimspector'

" Check grammar
" Plugin 'rhysd/vim-grammarous'

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

if has('termguicolors')
  set termguicolors
endif

set background=dark

let g:everforest_better_performance = 1
let g:everforest_transparent_background = 1
let g:everforest_disable_italic_comment = 1
let g:everforest_background = 'hard'
let g:airline_theme = 'everforest'
let g:everforest_ui_contrast = 'high'

let g:everforest_colors_override = {'bg0': ['#202020', '234'], 'bg2': ['#282828', '235']}

colorscheme everforest
" colorscheme palenight
" colorscheme one
" colorscheme OceanicNext

set encoding=UTF-8

set number           " Line number are good
set relativenumber   " Relative number to quickly run command

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set smartcase
set nowrap
set scrolloff=4
set mouse=a
set ruler
set hlsearch
set noswapfile
set cursorline

set pastetoggle=<F2>

" Share clipboard between OS vs VIM
set clipboard^=unnamed,unnamedplus

" Plugin
set undodir=~/.vim/undodir
set runtimepath^=~/.vim/bundle/ctrlp.vim

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

""" Variables

" Map leader to <space>
let mapleader = " "

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[4 q"
let &t_EI = "\e[2 q"

let g:airline_section_y = '{…}%3{codeium#GetStatusString()}'

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" let g:ctrlp_user_command = 'find %s -type f | grep -v "cat .ctrlpignore"'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|dist)|(\.(git|hg|svn))$',
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

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '🦴'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Nerdtree git status
let g:NERDTreeGitStatusUseNerdFonts = 1
let NERDTreeShowHidden=1

" Multiple Cursor
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_select_all_word_key = '<C-a>'

let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" Coc nvim
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

" https://github.com/puremourning/vimspector#supported-languages
let g:vimspector_base_dir='/Users/macintoshhd/.vim/bundle/vimspector'
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = ['vscode-js-debug', 'debugger-for-chrome']


" Load the JSON configuration file and parse it as a Vim dictionary
"  let g:vimspector_configurations = {}
" try
"   let vimspector_config_file = expand('~/.vim/configurations/vimspector-config/configurations/macos/javascript/default_config.json')
"   let vimspector_config = join(readfile(vimspector_config_file), "\n")
"   let g:vimspector_configurations = json_decode(vimspector_config)
" catch
"   " Handle any error if the JSON file cannot be loaded or parsed
"   echohl WarningMsg
"   echo "Error loading Vimspector configuration file"
"   echohl None
" endtry

""" Mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

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
" nnoremap <silent> K :call CocAction('doHover')<CR>
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

" Swap last 2 files
nnoremap <tab> :bp<CR> " Previous buffer file
nnoremap <S-tab> :bn<CR> " Next buffer file
nnoremap <Leader><Leader>c <c-^> " The last two files

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

""" Formatting
" command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

" Move a line of text using Leader+[jk]
nmap <Leader>j mz:m+<cr>`z
nmap <Leader>k mz:m-2<cr>`z
vmap <Leader>j :m'>+<cr>`<my`>mzgv`yo`z
vmap <Leader>k :m'<-2<cr>`>my`<mzgv`yo`z

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

nmap <silent> <leader>m :History<CR>

" fzf
nmap <Leader>t [fzf-p]
xmap <Leader>t [fzf-p]

nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>

nnoremap <silent> <Leader><Leader>h :Rg<CR>
nnoremap <silent> <Leader><Leader>f :Files<CR>

" Scroll in terminal
tnoremap <c-b> <c-\><c-n>

nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

" Every time we invoke Rg, FZF + ripgrep will not consider filename as a match in Vim
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

""" Auto CMD

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

""" END COC.NVIM

" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"\\ Delete all trailing space when saving file
autocmd BufWritePre * :%s/\s\+$//e

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

autocmd FileType apache setlocal commentstring=#\ %s

" Save session on quitting Vim
" autocmd VimLeave * NERDTreeClose
" autocmd VimLeave * mksession! session.vim

" Restore session on starting Vim
" autocmd VimEnter * call MySessionRestoreFunction()
" autocmd VimEnter * NERDTree

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

""" Custom Mapping
nmap <leader>tt :below vertical terminal<CR>
nmap <leader>yy :below horizontal terminal<CR>

" resize current buffer by +/- 5
nnoremap <S-Left> :vertical resize +5<cr>
nnoremap <S-Down> :resize +5<cr>
nnoremap <S-Up> :resize -5<cr>
nnoremap <S-Right> :vertical resize -5<cr>
