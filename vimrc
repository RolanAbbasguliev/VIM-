call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'scrooloose/nerdtree'
Plug 'ayu-theme/ayu-vim'
Plug 'romainl/flattened'
Plug 'vim-syntastic/syntastic'
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rhysd/vim-clang-format'
Plug 'OmniSharp/omnisharp-vim'
Plug '907th/vim-auto-save'
call plug#end()
let g:auto_save = 1  " enable AutoSave on Vim startup
set noswapfile
set exrc
set secure
syntax on
set termguicolors
let ayucolor="dark"
colorscheme ayu
set rnu!
map <C-n> :NERDTreeToggle<CR>
set tabstop=2
set shiftwidth=2
set softtabstop=2
let &path.="src/include,/usr/include/AL,"
set noexpandtab

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
