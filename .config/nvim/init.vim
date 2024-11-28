" Help
" 1 - custom settings
" 2 - List of plugins
" 3 - Custom plugin
" 4 - Custom mappings
" 5 - Lua plugin setup
" 6 - autocmd

execute pathogen#infect()
" init plug instruction
call plug#begin()

filetyp plugin indent on
syntax on

"""""""""""""""""""""""""""""""""""
" 1 - custom settings

set nocompatible
set number
set cursorline
let g:highlight_enable = 0
function ToggleCursorLine()
	if g:highlight_enable == 0
               hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
               hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
	       set cursorline
	       set cursorcolumn
	       let g:highlight_enable = 1
       else
	       hi clear cursorline
 " Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif              hi CursorLine   gui=underline cterm=underline
	       hi clear cursorcolumn
	       let g:highlight_enable = 0
        endif
endfunction

set clipboard=unnamedplus

syntax enable

set background=dark
" let g:solarized_termtrans=1
" let g:solarized_termcolors=16
" let g:solarized_contrast='low'
" colorscheme kanagawa
" colorscheme solarized8

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

" fold method
set foldmethod=syntax

"""""""""""""""""""""""""""""""""""
" 2 - List of plugins

" add deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" add deoplete-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" add deploete js
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" tree
Plug 'preservim/nerdtree'
" neerdtree icon
Plug 'ryanoasis/vim-devicons'
" linter
Plug 'dense-analysis/ale'
" vim fwf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" fugitive
Plug 'tpope/vim-fugitive'
"Useless plugin but fun
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'git@github.com:Eandrju/cellular-automaton.nvim.git'
"Ag configuration with the silver searcher
" vim multiple cursors
Plug 'terryma/vim-multiple-cursors'
"lua line"
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
" hcl syntax
Plug 'hashivim/vim-terraform'
" Rearrange your windows with ease
Plug 'sindrets/winshift.nvim'
" precognition.nvim assists with discovering motions (Both vertical and horizontal) to navigate your current buffer
Plug 'tris203/precognition.nvim'
" NeoVim dark colorscheme inspired by the colors of the famous painting by Katsushika Hokusai.
Plug 'rebelot/kanagawa.nvim'

"""""""""""""""""""""""""""""""""""
" 3 - Custom plugin
" 
let g:ackprg = 'ag --nogroup --nocolor --column'
"Customize fzf preview window
let g:fzf_preview_window = ['down']
" Fix files with prettier, and then ESLint.
let g:ale_fixers = {
\   'javascript': ['prettier','eslint'],
\   'yaml': ['yamlfix','prettier'],
\}

let g:ale_linters = {
\   'javascript': ['prettier','eslint'],
\   'yaml': ['yamllint'],
\} 
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
"run deoplete
let g:deoplete#enable_at_startup = 1
"define python path
let g:python3_host_prog = "/usr/bin/python3"
" open the list automatically
let g:neomake_open_list = 2

" other call need to be located after the plug end
call plug#end()

"""""""""""""""""""""""""""""""""""
" 4 - Custom mappings

" rearrange windows

" Start Win-Move mode:
nnoremap <C-W><C-M> <Cmd>WinShift<CR>
nnoremap <C-W>m <Cmd>WinShift<CR>

" Swap two windows:
nnoremap <C-W>X <Cmd>WinShift swap<CR>

" CursorLine
nnoremap <Leader>c :call ToggleCursorLine()<CR>

" forcus on current pane
noremap Zz <c-w>_ \| <c-w>\|
" Make all pane equal
noremap Zo <c-w>=

"""""""""""""""""""""""""""""""""""
" 5 - Lua plugin setup

" lua line setup
lua << END

require'nvim-web-devicons'.get_icon("/home/gmajkic/Downloads/FontPatcher/IBM 3270 Nerd Font Complete Mono Nerd Font Complete.otf", "otf", { default = true })

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'dracula',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {}
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {'diff'},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {{'tabs',mode = 1}}
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require("precognition").toggle()

require("kanagawa").load("wave")

END

"""""""""""""""""""""""""""""""""""
" 6 - autocmd

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
