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

"let g:ycm_python_interpreter_path = '/usr/local/bin/python3'
"let g:ycm_python_sys_path = []
"let g:ycm_extra_conf_vim_data = [
"  \  'g:ycm_python_interpreter_path',
"  \  'g:ycm_python_sys_path'
"  \]
"let g:ycm_global_ycm_extra_conf = '~/.global_extra_conf.py'
"
"let g:ycm_autoclose_preview_window_after_completion = 1

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
