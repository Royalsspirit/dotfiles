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
let g:solarized_termtrans=1
let g:solarized_termcolors=16
let g:solarized_contrast='low'
colorscheme solarized

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

" add deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" add deoplete-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"run deoplete
let g:deoplete#enable_at_startup = 1
"define python path
let g:python3_host_prog = "/usr/bin/python"

call plug#end()
