" ----------------------------------------------------------------------------------------
call plug#begin()

Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'numkil/ag.nvim'
Plug 'karb94/neoscroll.nvim'

" Initialize plugin system
call plug#end()

" ----------------------------------------------------------------------------------------

" Smooth scroll
" lua require('neoscroll').setup({ easing_function = "quadratic" })


"Italic support
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

"set vb t_vb=.                      "Eliminar campanita
set t_Co=256
syntax enable                      "Plugins propios de VIM (BASICO)

"Color scheme
set background=dark
set termguicolors

"
"··Grubvox colorscheme
let g:gruvbox_contrast_dark='soft'
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
colorscheme gruvbox


" set completeopt=menu,preview,noinsert

set laststatus=2               "Always shows status line
set statusline=%F\ %m\ %=\ %y\ %l/%L:%c
se shm-=S "Show search match numbers (Vim >= 8.1, 2019)
" highlight LineNr guibg=#181b1e  "highlight line numbers

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
" set backspace=indent,eol,start  " allow backspacing over everything in insert mode
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
set nowritebackup
set nowb

set wrap                        "wrapping
set textwidth=90
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

" ================  Markdown Preview  config. ======
let vim_markdown_preview_github=1
let vim_markdown_preview_temp_file=1  " Remove the tempfile

" ================= Coc config ================
let g:coc_global_extensions = [
            \'coc-jedi@0.30.1',
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
let s:current_python_path=$CONDA_PYTHON_EXE
call coc#config('python', {'pythonPath': s:current_python_path})

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1):
        \ CheckBackSpace() ? "\<Tab>" :
        \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <cr> coc#pum#visible() && coc#pum#info()['index'] != -1 ? coc#pum#confirm() :
        \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


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
" :autocmd FileType python set formatoptions-=t

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
nnoremap <C-S-Right> 5<c-w>>
nnoremap <C-S-Left> 5<c-w><

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
