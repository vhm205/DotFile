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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()
""" END COC.NVIM

" Custom Mapping
" Open terminal in vim
nmap <leader>tt :below vertical terminal<CR>

" resize current buffer by +/- 5
nnoremap <S-Left> :vertical resize +5<cr>
nnoremap <S-Down> :resize +5<cr>
nnoremap <S-Up> :resize -5<cr>
nnoremap <S-Right> :vertical resize -5<cr>
