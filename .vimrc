syntax on

set term=xterm-256color
colorscheme railscasts

set viminfo='1000,f1,n~/.vim/viminfo
"The f1 makes file marks persist between sessions

set tabstop=4	"Visual tab size
set softtabstop=4
set shiftwidth=4
set expandtab

set number	"Show line numbers
set showcmd	"Mini ommand log in corner
set cursorline	"Highlight current line

"Enable contextual filetype settings
filetype on
filetype plugin on
filetype indent on

"Visual helpers
set wildmenu	"visual tab complete
set showmatch	"Show matching parens, etc

"Search helpers
set incsearch	"Search as you type
set hlsearch	"Highlight matches
nnoremap <leader><space> :nohlsearch<CR>

"Folding!
set foldenable
set foldlevelstart=0
set foldnestmax=18
nnoremap <space> za	"space opens and closes folds
set foldmethod=indent	"fold based on indents

"Move vertically by visual line
nnoremap j gj
nnoremap k gk

inoremap jk <esc>
let mapleader=","	"set , as the thingy

augroup configgroup
    autocmd!
    "autocmd VimEnter * highlight clear SignColumn
    autocmd BufNewFile,BufRead *.tpp set filetype=cpp
    autocmd BufNewFile,BufRead makefile set filetype=Makefile
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
"    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType makefile setlocal noexpandtab
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
"    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END


