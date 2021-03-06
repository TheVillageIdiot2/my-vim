"Enable pathogen
execute pathogen#infect()

"Enable syntax parsing/highlighting
syntax on

"Don't use vi settings
set nocompatible
set encoding=utf-8

"Visual stuff
set term=xterm-256color
colorscheme railscasts

"Enable marks persistence
set viminfo='1000,f1,n~/.vim/viminfo
"The f1 makes file marks persist between sessions

"Tabbing and stuff
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"Use comma for line leader
let mapleader = ","

set cursorline	"Highlight current line

"Tweak line numbering to be relative
if exists("+rnu")
    set rnu
    "Turn on/off while going into insert mode
    au InsertEnter * :set nu
    au InsertEnter * :set rnu
    au FocusLost * :set nu
    au FocusGained * :set rnu
else
    set number
endif


"Enable contextual filetype settings
filetype on
filetype plugin on
filetype plugin indent on
filetype indent on
set autoindent

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
"space opens and closes folds
nnoremap <space> za	
"fold based on indents
set foldmethod=indent	

"Move vertically by visual line
nnoremap j gj
nnoremap k gk

"Quick edit:
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"Quick escape
inoremap jk <esc>

"Quick tabulate
"nnoremap <leader>t vi( :Tab/\v(^|\(|,|\s)[a-zA-Z]/l0<cr>
nnoremap <silent><leader>t vi(:s/ \+/ /g<cr>vi(:Tab/,/r0l0l0l0l0l0l0<cr>:noh<cr>
":Tabularize [a-zA-Z ]?*,
"int sparky(int a ,
"           int b , int be , int bd ,
"           int c ,
"          int d)

"Quick navigation to start/end of line, top/bottom of page
nnoremap H ^
nnoremap J <C-D>
nnoremap K <C-U>
nnoremap L A<esc>

"Save cursor position

"Filetype specific stuff
augroup cplusplus
    autocmd!
    autocmd BufNewFile,BufRead *.tpp set filetype=cpp "Alias tpp to be cpp
augroup END

augroup java
    autocmd!
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    "    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
augroup END

autocmd BufNewFile,BufRead js,jsx,html set filetype=htmls
augroup htmljs
    autocmd!
    autocmd FileType html setlocal foldmethod=syntax
    autocmd FileType html setlocal tabstop=2
    autocmd FileType html setlocal softtabstop=2
    autocmd FileType html setlocal shiftwidth=2
    autocmd FileType html setlocal expandtab
augroup END

autocmd BufNewFile,BufRead makefile set filetype=Makefile 
augroup makefiles
    autocmd!
    autocmd FileType makefile setlocal noexpandtab
augroup END

augroup pythonscripts
    autocmd!
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
augroup END

augroup shellscripts
    autocmd!
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

augroup rust
    autocmd!
    autocmd BufEnter *.rs let g:syntastic_rust_checkers = ['rustc']
    autocmd BufEnter *.rs let g:syntastic_quiet_messages = {"regex": 'is unstable and should only be used'}
    autocmd BufEnter *.rs let g:rustfmt_autosave = 1
augroup END



"Syntastic stuff
"Setup statusline notifications for errors
set statusline+=%#warningsmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"Auto-populate user defined stuff
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

"Run checker on open, but not on close
let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_w = 1
let g:syntastic_check_on_wq = 0
