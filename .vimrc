call plug#begin('~/.vim/plugged')
Plug 'HerringtonDarkholme/yats.vim'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'dart-lang/dart-vim-plugin'
call plug#end()


let g:gruvbox_contrast_dark = 'hard'
set background=dark
au VimEnter * highlight clear SignColumn
colorscheme gruvbox

set nocompatible
set signcolumn=yes
set shortmess+=c
set updatetime=200
set nobackup
set nowritebackup
filetype off
syntax on
filetype plugin indent on
set wrap
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set backspace=indent,eol,start
set encoding=utf-8

" undercurl
"let &t_Cs = "\uFE4F"
"let &t_Ce = "."


au VimEnter * highlight CocErrorHighlight ctermbg=none cterm=underline
au VimEnter * highlight CocWarningHighlight ctermbg=none cterm=underline
au VimEnter * highlight CocInfoHighlight ctermbg=none cterm=underline

au VimEnter * highlight CocErrorSign ctermbg=none ctermfg=red
au VimEnter * highlight CocWarningSign ctermbg=none ctermfg=yellow
au VimEnter * highlight CocInfoSign ctermbg=none ctermfg=blue


let g:ale_sign_error = '>>'
let g:ale_sign_warning = '->'
let g:ale_info = '--'
let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_c_clangformat_executable = 'clang-format'

nnoremap <c-f> :%CocFix <CR>

let b:ale_fixers = {
 \ 'dart':['dartfmt'],
 \ 'css': ['prettier'],
 \ 'scss':['prettier'],
 \ 'html':['prettier'],
 \ 'typescript': ['eslint', 'prettier'],
 \ 'javascript':['prettier'],
 \ 'c': ['clang-format'],
 \ 'cpp':['clang-format'],
 \ 'json':['prettier']
 \}

let g:ale_linters = {
 \ 'dart':['dartanalyzer'],
 \ 'typescript':['eslint'],
 \ 'javascript': ['eslint'],
 \ 'python': ['pylint']
 \}

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
