set nocompatible              " be iMproved, required
filetype off                  " required

" Start plug
call plug#begin('~/.vim/plugged')
" Editor Plugs
Plug 'easymotion/vim-easymotion'
Plug 'https://github.com/vim-scripts/paredit.vim'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/kien/rainbow_parentheses.vim.git'
Plug 'https://github.com/ervandew/supertab'
Plug 'https://github.com/terryma/vim-expand-region'
Plug 'https://github.com/godlygeek/tabular'
Plug 'https://github.com/wellle/targets.vim.git'
Plug 'https://github.com/scrooloose/nerdcommenter'

" Feature Plugs
Plug 'https://github.com/scrooloose/nerdtree'

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required
syntax on

"set colorcolumn=110
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab
set t_Co=256

au BufReadPost *.rkt,*.rktl set filetype=scheme
au FileType lua setlocal ai ts=2 st=2 sw=2 noex
au FileType python setlocal ai ts=4 st=4 sw=4 ex

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
set mouse=a
set foldmethod=indent
set foldlevel=99
"set statusline+=%F\ %l\:%c
set laststatus=2
"set ruler
set nu
"set background=dark
"silent! colorscheme gruvbox
set hlsearch "highlight search results
set hidden "change buffers without saving
set confirm "ask to save before quitting
set backspace=indent,eol,start "fix backspace
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

let mapleader = "\<Space>" "Set space to leader

"Highlight trailing spaces"
:highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

"buffers
noremap <Leader>k :bprev<CR>
noremap <Leader>j :bnext<CR>
noremap <Leader>w :w<CR>
noremap <Leader>d :bd<CR>

"copy/paste
"visual mode: copy selection
vnoremap <Leader>y "+y
"normal mode: copy line
vnoremap <Leader>yy "+yy
"normal mode: copy file path
noremap <Leader>y :let @+ = expand("%")<CR>
"normal mode: paste
noremap <Leader>p "+p

"Faster scrolling
noremap <C-H> ^
noremap <C-L> $
noremap <C-e> 10<C-e>
noremap <C-y> 10<C-y>

"=======THE NERD TREE========"
noremap <C-n> :NERDTreeToggle<CR>
"==========================="

"===========Expand Tab======"
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"==========================="
