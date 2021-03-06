set nocompatible              " be iMproved, required
filetype off                  " required

" Start plug
call plug#begin('~/.vim/plugged')


" Langauge Plugins
"Plug 'https://github.com/lambdatoast/elm.vim'
"Plug 'https://github.com/wting/rust.vim'
"Plug 'https://github.com/wlangstroth/vim-racket.git'
"Plug 'git://github.com/tpope/vim-fireplace.git'
"Plug 'derekwyatt/vim-scala'
"Plug 'https://github.com/neovimhaskell/haskell-vim'
Plug 'https://github.com/hynek/vim-python-pep8-indent'
"Plug 'nsf/gocode', {'rtp': 'vim/'}
"Plug 'https://github.com/fatih/vim-go'
"Plug 'rust-lang/rust.vim'
"Plug 'https://github.com/jystic/thrift.vim'
Plug 'https://github.com/heavenshell/vim-pydocstring'
"Plug 'https://github.com/flowtype/vim-flow.git'
"Plug 'posva/vim-vue'
"keys
Plug 'https://github.com/pedrohdz/vim-yaml-folds'
Plug 'https://github.com/leafgarland/typescript-vim'
au BufReadPost *.rkt,*.rktl set filetype=scheme



" Editor Plugs
Plug 'easymotion/vim-easymotion'
Plug 'https://github.com/vim-scripts/paredit.vim'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/kien/rainbow_parentheses.vim.git'
"Plug 'https://github.com/scrooloose/syntastic.git'
"Plug 'https://github.com/Valloric/YouCompleteMe'
Plug 'https://github.com/ervandew/supertab'
Plug 'https://github.com/terryma/vim-expand-region'
Plug 'https://github.com/godlygeek/tabular'
Plug 'https://github.com/wellle/targets.vim.git'
Plug 'https://github.com/scrooloose/nerdcommenter'
" Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'https://github.com/tommcdo/vim-exchange.git'
Plug 'https://github.com/Raimondi/delimitMate'

" Themes
Plug 'https://github.com/vim-scripts/up.vim'
Plug 'https://github.com/altercation/vim-colors-solarized'
Plug 'https://github.com/jdkanani/vim-material-theme'
Plug 'https://github.com/blueshirts/darcula'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/dracula/vim'

" Feature Plugs
"Plug 'mileszs/ack.vim'
Plug 'https://github.com/scrooloose/nerdtree'
"Plug 'https://github.com/bling/vim-airline'
Plug 'https://github.com/tpope/vim-fugitive'
"Plug 'https://github.com/vimwiki/vimwiki.git'
"Plug 'https://github.com/fholgado/minibufexpl.vim'

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required
syntax on

set colorcolumn=110
set tabstop=4
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
set nonu
set background=dark
silent! colorscheme gruvbox
set hidden "change buffers without saving
set confirm "ask to save before quitting
set guioptions-=r
set guioptions-=L
set backspace=indent,eol,start "fix backspace
set hlsearch
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set tabstop=4

let mapleader = "\<Space>" "Set space to leader

"Highlight trailing spaces"
:highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

"browse through tabs
noremap <Leader>h :tabprev<CR>
noremap <Leader>l :tabnext<CR>
noremap <Leader>k :bprev<CR>
noremap <Leader>j :bnext<CR>
"noremap <Leader>1 :buffer 1<CR>
"noremap <Leader>2 :buffer 2<CR>
"noremap <Leader>3 :buffer 3<CR>
"noremap <Leader>4 :buffer 4<CR>
"noremap <Leader>5 :buffer 5<CR>
"noremap <Leader>6 :buffer 6<CR>
"noremap <Leader>7 :buffer 7<CR>
"noremap <Leader>8 :buffer 8<CR>
"noremap <Leader>9 :buffer 9<CR>

"Leader shortcuts
noremap <Leader>w :wa<CR>
noremap <Leader>d :bd<CR>
noremap <Leader>q :qa<CR>
noremap <Leader>wq :wqa<CR>
noremap <Leader>e :e

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
"Remap C-v for block select
nnoremap <C-a> <C-v>

"Faster scrolling
noremap <C-H> ^
noremap <C-L> $
noremap <C-e> 10<C-e>
noremap <C-y> 10<C-y>

"Switch to last tab
let g:lasttab = 1
nmap <Leader><Tab> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


"===========for Ag.vim================"
"if executable('ag') " use ag instead of ack
  "let g:ackprg = 'ag --vimgrep'
"endif
"noremap <Leader>f :AckFile! 
"noremap <Leader>/ :Ack! 
"noremap <Leader>* yiw<Esc>:Ack! <C-R>"<CR>
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
"if !exists('g:airline_symbols')
    "let g:airline_symbols = {}
"endif
" unicode symbols
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.whitespace = 'Ξ'

"let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#tabline#show_tabs = 1
"let g:airline#extensions#tabline#show_buffers = 0
"let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
"let g:airline#extensions#tagbar#enabled = 0

"let g:airline#extensions#eclim#enabled = 0
"==========================="

"=======ctrlP=============="
"noremap <C-SPACE> :CtrlPBuffer<CR>

"=========FZF=============="
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

noremap <C-P> :GFiles<CR>
noremap <Leader>/ :Ag 
noremap <Leader>* yiw<Esc>:Ag <C-R>"<CR>
noremap <C-F> :Lines<CR>
noremap <Leader>t :Tags 
"============================"


"=========Denite==========="
"noremap <C-P> :Denite buffer file_rec <CR>
"noremap <C-F> :Denite line <CR>
"call denite#custom#map(
            "\ 'insert',
            "\ '<CR>',
            "\ '<denite:enter_mode:normal>',
            "\ 'noremap'
            "\)
"call denite#custom#map(
            "\ 'normal',
            "\ '<ESC>',
            "\ '<denite:quit>',
            "\ 'noremap'
            "\)

"=======Rusty Tags=========="
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWrite *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&"
"==========================="

"===========Eclim==========="
autocmd FileType java nnoremap <silent> <buffer> <cr> :JavaSearch<cr>
autocmd FileType java nnoremap <silent> <buffer> <c-cr> :JavaCorrect<cr>
autocmd FileType java nnoremap <silent> <buffer> <leader>s :JavaDocSearch -x declarations<cr>
autocmd FileType java nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
autocmd FileType java nnoremap <silent> <buffer> <leader>v :Validate<cr> :JavaImportOrganize<cr> :JavaFormat<cr>
"=========================="

"===========YCM============="
let g:ycm_autoclose_preview_window_after_completion = 1
set splitbelow
"==========================="

"===========Expand Tab======"
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"==========================="

"==========Pydocstring======="
nmap <silent> <C-c> <Plug>(pydocstring)
"==========================="

"=======Shortcuts=========="
iab cfor for(i = 0; i < ; ++i)
iab gfor for i := 0; i < ; ++i
iab cforj for(j = 0; j < ; ++j)
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

"=============Flow type===="
let g:flow#enable = 1

"=========clang-format========"
map <C-K> :pyf <path-to-this-file>/clang-format<cr>
imap <C-K> <c-o>:pyf <path-to-this-file>/clang-format<cr>
"==========================="

"=====compile===="
map <F5> : !gcc -Wall -Wextra -Wstrict-prototypes -pedantic -ansi % && ./a.out <CR>
"==============="
