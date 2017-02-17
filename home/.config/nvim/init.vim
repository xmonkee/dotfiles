set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'


" Langauge Plugins
"Plugin 'https://github.com/lambdatoast/elm.vim'
"Plugin 'https://github.com/wting/rust.vim'
"Plugin 'https://github.com/wlangstroth/vim-racket.git'
"Plugin 'git://github.com/tpope/vim-fireplace.git'
"Plugin 'derekwyatt/vim-scala'
"Plugin 'https://github.com/neovimhaskell/haskell-vim'
Plugin 'https://github.com/hynek/vim-python-pep8-indent'
Plugin 'https://github.com/fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'https://github.com/jystic/thrift.vim'

" Editor Plugins
Plugin 'https://github.com/vim-scripts/paredit.vim'
Plugin 'https://github.com/tpope/vim-surround'
Plugin 'https://github.com/kien/rainbow_parentheses.vim.git'
"Plugin 'https://github.com/scrooloose/syntastic.git'
Plugin 'https://github.com/godlygeek/tabular'
Plugin 'https://github.com/wellle/targets.vim.git'
Plugin 'https://github.com/scrooloose/nerdcommenter'
Plugin 'https://github.com/ctrlpvim/ctrlp.vim'
Plugin 'https://github.com/tommcdo/vim-exchange.git'
Plugin 'https://github.com/vim-scripts/up.vim'
Plugin 'https://github.com/altercation/vim-colors-solarized'

" Feature Plugins
Plugin 'mileszs/ack.vim'
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/bling/vim-airline'
Plugin 'https://github.com/tpope/vim-fugitive'
Plugin 'https://github.com/vimwiki/vimwiki.git'
"Plugin 'https://github.com/fholgado/minibufexpl.vim'

call vundle#end()            " required
filetype plugin indent on    " required
syntax on

set clipboard=unnamedplus
set softtabstop=4
set shiftwidth=4
set expandtab
set t_Co=256
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
set mouse=a
set foldmethod=indent
set foldlevel=99
set statusline+=%F\ %l\:%c
set laststatus=2
set ruler
set nu
set background=dark
colorscheme solarized
set hidden "change buffers without saving
set confirm "ask to save before quitting
set guioptions-=r
set guioptions-=L
set clipboard=unnamed
set backspace=indent,eol,start "fix backspace
set hlsearch
set guifont=Ubuntu\ Mono\ 13
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set tabstop=4
colorscheme up

let mapleader = "\<Space>" "Set space to leader

"browse through tabs
noremap <Leader>h :tabp<CR>
noremap <Leader>l :tabn<CR>
noremap <Leader>1 1gt
noremap <Leader>2 2gt
noremap <Leader>3 3gt
noremap <Leader>4 4gt
noremap <Leader>5 5gt
noremap <Leader>6 6gt
noremap <Leader>7 7gt
noremap <Leader>8 8gt
noremap <Leader>9 9gt

"Leader shortcuts
noremap <Leader>w :w<CR>
noremap <Leader>d :bd<CR>
noremap <Leader>q :qa<CR>
noremap <Leader>wq :wqa<CR>
noremap <Leader>e :e 

"Use <Leader> k to move rest of line up
noremap <Leader>k DO<Esc>p==
"Use <Leader> j to move rest of line down
noremap <Leader>j Do<Esc>p==

"Use <Leader> y to copy file path in normal mode
noremap <Leader>y :let @+ = expand("%")<CR>

"========Copy and paste with usual keys==========

"paste in normal mode
nnoremap <C-v> "+p
"paste in visual mode
vnoremap <C-v> "+p
"paste in insert mode
inoremap <C-v> <C-R>+
"paste in command mode
cnoremap <C-v> <C-R>+
"copy in visual mode
vnoremap <C-c> "+y
"Copy whole line in normal mode
nnoremap <C-c> "+yy
" Select all
nnoremap <C-a> ggVG

"Faster scrolling
noremap <C-j> }
noremap <C-k> {
noremap <C-H> ^
noremap <C-L> $
noremap <C-e> 10<C-e>
noremap <C-y> 10<C-y>

"Switch to last tab
let g:lasttab = 1
nmap <Leader><Tab> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


"===========for Ag.vim================"
if executable('ag') " use ag instead of ack
  let g:ackprg = 'ag --vimgrep'
endif
noremap <Leader>f :AckFile! 
noremap <Leader>/ :Ack! 
noremap <Leader>* yiw<Esc>:Ack! <C-R>"<CR>
"======================================"


"=======for buffers press tab==========="
set wildchar=<Tab> wildmenu wildmode=full
"======================================"

"=========== pymode ========"
let g:pymode_options_max_line_length = 100
"==========================="

"========= Sytastic ======="
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_python_flake8_args = "--max-line-length=100"
""let g:syntastic_python_checkers=['flake8 --ignore=W291 --ignore=E111 --ignore=E302']
""let g:syntastic_python_checkers=['arc lint']
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1
"let g:syntastic_disabled_filetypes=['java']
"=========================="

"=======THE NERD TREE========"
noremap <C-n> :NERDTreeToggle<CR>
"==========================="

"======== Vim Airline ======"
"let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tagbar#enabled = 1
"==========================="

"=======ctrlP=============="
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
noremap <C-SPACE> :CtrlPBuffer<CR>

"=======Rusty Tags=========="
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWrite *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&"
"==========================="

"=======Shortcuts=========="
iab cfor for(i = 0; i < ; ++i)
iab cforj for(j = 0; j < ; ++j)
iab cmain 
\<CR>#include <stdio.h>
\<CR>#include <stdlib.h>
\<CR>
\<CR>int main(int argc, char **argv){
\<CR>return 0;
\<CR>}

iab cstruct 
\<CR>typedef struct {
\<CR>
\<CR>} T;

"=========================="

"=====Open vimwiki vlinks locally====="
function! VimwikiLinkHandler(link)
    " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
    "   1) [[vfile:~/Code/PythonProject/abc123.py]]
    "   2) [[vfile:./|Wiki Home]]
    let link = a:link
    if link =~# '^vfile:'
        let link = link[1:]
    else
        return 0
    endif
    let link_infos = vimwiki#base#resolve_link(link)
    if link_infos.filename == ''
        echomsg 'Vimwiki Error: Unable to resolve link!'
        return 0
    else
        exe 'tabnew ' . fnameescape(link_infos.filename)
        return 1
    endif
endfunction
"=========================="

