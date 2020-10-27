execute pathogen#infect()
" init plug instruction
call plug#begin()

filetyp plugin indent on
syntax on

set nocompatible
set number
set clipboard=unnamedplus

syntax enable
set background=dark
"let g:solarized_termtrans=1
"let g:solarized_termcolors=16
"let g:solarized_contrast='low'
"colorscheme solarized

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

" add deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" add deoplete-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" add deploete js
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" tree
Plug 'preservim/nerdtree'
" linter
Plug 'dense-analysis/ale'

" Fix files with prettier, and then ESLint.
let g:ale_fixers = {
\   'javascript': ['prettier','eslint'],
\}

let g:ale_linters = {
\   'javascript': ['prettier','eslint'],
\} 
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

"run deoplete
let g:deoplete#enable_at_startup = 1
"define python path
let g:python3_host_prog = "/usr/bin/python"

call plug#end()
