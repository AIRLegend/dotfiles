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

Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/nerdtree'
Plugin 'joshdick/onedark.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'lervag/vimtex'
Plugin 'tpope/vim-surround'
Plugin 'mxw/vim-jsx' "JS ES6 syntax (node)
Plugin 'tmhedberg/SimpylFold' "Fold functions
Plugin 'TaDaa/vimade'  "Fade inactive buffer
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
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
"colorscheme moody
colorscheme lucid

set completeopt=menu,preview,noinsert
" COLORSCHEME onedark -----------------
"let g:onedark_termcolors=256
"let g:onedark_terminal_italics=1
"colorscheme onedark
"Override onedark settings
"hi Folded guifg=#87afaf guibg=#4b5263 guisp=#080808 gui=NONE ctermfg=109 ctermbg=232 cterm=NONE
" -------------------------------------

set laststatus=2               "Always shows status line
set statusline=%F\ %m\ %=\ %y\ %l/%L:%c
se shm-=S "Show search match numbers (Vim >= 8.1, 2019)
highlight LineNr guibg=#181b1e  "highlight line numbers


set encoding=utf-8

set nocompatible
set hidden                      "Let me open new buffers without saving
set incsearch                   "Incremental search. Add highlight on the fly

set wildmenu                    "All matching files when tab complete (:find file)
set path+=**                    "Autocompletado para ficheros en el dir

set showmode                    " always show what mode we're currently editing in
set wrap                        " don't wrap lines
set tw=0                        " Don't auto linebreak
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
" set columns=90

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

" ================  Markdown Preview  config. ======
let vim_markdown_preview_github=1
let vim_markdown_preview_temp_file=1  " Remove the tempfile

" ================= Coc config ================
let g:coc_global_extensions = [
            \'coc-python',
            \'coc-snippets',
            \'coc-prettier',
            \'coc-json',
            \'coc-tsserver',
            \'coc-pairs']

" ========== Detect active python env =========
if $CONDA_PREFIX == ""
  let s:current_python_path=$CONDA_PYTHON_EXE
else
  let s:current_python_path=$CONDA_PREFIX.'/bin/python'
endif
call coc#config('python', {'pythonPath': s:current_python_path})

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(noc-references)

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

"Control + Space to trigger completion
inoremap <silent><expr> <C-Space> coc#refresh()
"Confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


" ================ Aux. Functions ================
function! SpellCheck()
    set spell!
    syntax spell toplevel
    if &spell
        :setlocal spell spelllang=es
        echo "Spellcheck ON"
    else
        echo "Spellcheck OFF"
    endif
endfunction

function! SpellCheckEN()
    set spell!
    syntax spell toplevel
    if &spell
        :setlocal spell spelllang=en_gb
        echo "Spellcheck ON (ENGLISH)"
    else
        echo "Spellcheck OFF (ENGLISH)"
    endif
endfunction

" Remove trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e


"Highlight trailing whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" ================ Latex ========================
:autocmd FileType tex  map <F2> :w<CR>:!pdflatex %<CR><CR>
:autocmd FileType tex  map <S-F6> :call SpellCheckEN()<CR>
:autocmd FileType tex map <F6> :call SpellCheck()<CR>

" ================ TXT ========================
:autocmd FileType text map <S-F6> :call SpellCheckEN()<CR>
:autocmd FileType text map <F6> :call SpellCheck()<CR>

" ================ Markdown ========================
:autocmd FileType markdown  map <S-F6> :call SpellCheckEN()<CR>
:autocmd FileType markdown  map <F6> :call SpellCheck()<CR>

:command SpellCheck call SpellCheckEN()
:command SpellCheckES call SpellCheck()

" ================ Python ========================
:autocmd FileType python set formatoptions-=t

" =============== Some other remaps ===================
imap kk <Esc>
imap jj <Esc>
noremap vv <C-v>
inoremap <C-Space> <C-p>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

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
"nmap <C-S-P> :call <SID>SynStack()<CR>
"function! <SID>SynStack()
"  if !exists("*synstack")
"    return
"  endif
"  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
"endfunc
