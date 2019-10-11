" ------------------------------------------------------------------
"                     VUNDLE PLUGIN MANAGER

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

Plugin 'scrooloose/nerdtree'
Plugin 'joshdick/onedark.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript' 
Plugin 'mxw/vim-jsx' "JS ES6 syntax (node)
Plugin 'tmhedberg/SimpylFold' "Fold functions
Plugin 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" --------------------------------------------------------------------


"Italic support
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

"set vb t_vb=.                 "Eliminar campanita 
set t_Co=256
syntax enable                      "Plugins propios de VIM (BASICO)
set background=dark
set termguicolors
"Color scheme
":colorscheme moody

" COLORSCHEME onedark -----------------
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
colorscheme onedark
"Override onedark settings
hi Folded guifg=#87afaf guibg=#4b5263 guisp=#080808 gui=NONE ctermfg=109 ctermbg=232 cterm=NONE
" -------------------------------------

:set laststatus=2               "Always shows status line
set statusline+=%F

"highlight LineNr guibg=#181b1e  "highlight line numbers
" =========================== Airline bar ======================
let g:airline_theme='molokai'
"let g:airline_theme='lucius'

 set noshowmode "Remove status mode text
"let g:airline_powerline_fonts = 1   "Activate the triangles as separators
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"
""" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
""
""" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
"
"let g:Powerline_symbols='unicode'


let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#whitespace#enabled = 0 "Do not show `trailing space` warning

set encoding=utf-8

set nocompatible

set incsearch                   "Incremental search. Add highlight on the fly

set wildmenu                    "All matching files when tab complete (:find file)
set path+=**                    "Autocompletado para ficheros en el dir

set showmode                    " always show what mode we're currently editing in
set wrap                        " don't wrap lines
set linebreak                   " Word wrap level (not character)
set tabstop=4                   " a tab is four spaces
set smarttab

set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set relativenumber
set ignorecase                  " ignore case when searching
set visualbell
set smartcase                   
set autoread  
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set title
set ruler
set hlsearch

"Folding config
let g:SimpylFold_docstring_preview=1


" iTerm2 is currently slow as balls at rendering the nice unicode lines, so for
" now I'll just use ASCII pipes.  They're ugly but at least I won't want to kill
" myself when trying to move around a file.
set fillchars=diff:⣿,vert:│
set fillchars=diff:⣿,vert:\|

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800


" Use system clipboard
if has('clipboard')
    set clipboard=unnamedplus    "LINUX
endif
set clipboard=unnamed            "OSX

let mapleader = "-"
let maplocalleader="\<space>"

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

set wrap                        "wrapping
set textwidth=85
"set linebreak
set wrapmargin=0
set formatoptions+=t
set colorcolumn=+1
set columns=90

" Enable folding
set foldmethod=indent
set foldlevel=99

" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" =================  Syntastic config. ================
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=W605,E501,E231' "Ignore Invalid end sequence warning

" =================  Vimtex config. ================
let g:vimtex_disable_version_warning = 0
let g:vimtex_compiler_latexmk = {'callback' : 0}
" Better tex support. sometime recognises plaintext
let g:tex_flavor='latex'

" ================= Snippets config ================
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-g>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" ================= YCM config ================
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_python_binary_path = '/usr/bin/'
let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
let g:ycm_server_python_interpreter = '/usr/bin/python3'
" ================= Pymode config ================
" Rope support
call pymode#default('g:pymode_rope', 1)
let g:pymode_rope_goto_definition_bind='<leader>g'
" ================ Aux. Functions ================
function! ToggleSpellCheck()
    set spell!
    syntax spell toplevel
    if &spell
        :setlocal spell spelllang=es
        echo "Spellcheck ON"
    else
        echo "Spellcheck OFF"
    endif
endfunction

function! ToggleSpellCheckEN()
    set spell!
    syntax spell toplevel
    if &spell
        :setlocal spell spelllang=en_gb
        echo "Spellcheck ON (ENGLISH)"
    else
        echo "Spellcheck OFF (ENGLISH)"
    endif
endfunction


"Highlight trailing whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" ================ Latex ========================
:autocmd FileType tex  map <F2> :w<CR>:!pdflatex %<CR><CR>
:autocmd FileType tex  map <S-F6> :call ToggleSpellCheckEN()<CR>
:autocmd FileType tex map <F6> :call ToggleSpellCheck()<CR>

" ================ TXT ========================
:autocmd FileType txt  map <S-F6> :call ToggleSpellCheckEN()<CR>
:autocmd FileType txt map <F6> :call ToggleSpellCheck()<CR>
" ================ Markdown ========================
:autocmd FileType markdown  map <S-F6> :call ToggleSpellCheckEN()<CR>
:autocmd FileType markdown  map <F6> :call ToggleSpellCheck()<CR>

" =============== Some other remaps ===================
imap kk <Esc>
imap jj <Esc>
noremap vv <C-v>
inoremap <C-Space> <C-p>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"Tab to cycle buffers
nnoremap <Tab> :bn<cr>
nnoremap <S-Tab> :bp<cr>
"leader key twice to cycle between last two open buffers
nnoremap <leader><leader> <c-^>

"Quick split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Unfold/fold current fold
nnoremap <Space> za

nnoremap <esc><esc> :silent! nohls<cr>
nnoremap <c-left> 5<c-w>>
nnoremap <c-right> 5<c-w><

"Move to the begin/end faster
nnoremap H ^
nnoremap L g_ 
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" Faster moving command mode. (BEGIN/ END)
cnoremap <c-a> <home>
cnoremap <c-e> <end>

"Nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
