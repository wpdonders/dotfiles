" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" Default to plugin-less vi if vim-starting doesn't exist
if has('vim_starting')
  set nocompatible

  " Add NeoBundle runtimepath
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Intialize NeoBundle
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Sensibile vim settings
NeoBundle 'tpope/vim-sensible'

" Git integration
NeoBundle 'tpope/vim-fugitive'

" Useful keymapping with ],[
NeoBundle 'tpope/vim-unimpaired'

" Add, remove, change surrounding easily
NeoBundle 'tpope/vim-surround'

" Be able to dot-repeat more
NeoBundle 'tpope/vim-repeat'

" Better shell integration
NeoBundle 'tpope/vim-dispatch'

" Highlight spaces and provide :FixWhiteSpace
NeoBundle 'bronson/vim-trailing-whitespace'

" Better Matlab syntax rules
NeoBundle 'vim-scripts/MatlabFilesEdition'

" Shell integration
" NeoBundle 'xolox/vim-misc'
" NeoBundle 'xolox/vim-shell'

" Airline, the lightweight useful bottom-bar
NeoBundle 'bling/vim-airline'

" Solarized theme
NeoBundle 'altercation/vim-colors-solarized'

" Useful mid-level motion using pattern of two
NeoBundle 'justinmk/vim-sneak'

" Incremental search improvement
NeoBundle 'haya14busa/incsearch.vim'

"" Extra text objects
NeoBundle 'wellle/targets.vim'

"" Pandoc support (also contains markdown syntax rules)
NeoBundle 'vim-pandoc/vim-pandoc'
NeoBundle 'vim-pandoc/vim-pandoc-syntax'

" Text object for identation blocks (vii, vai, vaI)
NeoBundle 'michaeljsmith/vim-indent-object'

" Latex integration
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'

" Easy alignment using :EasyAlign
NeoBundle 'junegunn/vim-easy-align'

" End of Neobundle
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" Set background and theme
set background=light
color solarized

" Lazy redraw to speed up macros
set lazyredraw

" Set unecoding to utf-8 because I have standards
set encoding=utf-8

" Mappings for 'haya14busa/incsearch'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Set swap/backupdir to standard tmp dir
set backupdir=$TMP
set undodir=$TMP
set dir=$TMP

" Settings for 'LaTeX-Box-Team/LaTeX-Box'
let g:LatexBox_latexmk_async=1
let g:LatexBox_viewer="SumatraPDF"
let g:LatexBox_quickfix=4 "Only open on errors
let g:LatexBox_latexmk_options='-output-directory=build'
let g:LatexBox_aux_dir='build'

" Use latex, main file is main.tex
let g:tex_flavor='latex'
au BufEnter *.tex if !exists('b:main_tex_file') | let b:main_tex_file="main.tex" | endif

" Sensitivity to case in search
set ignorecase " ignore case
set smartcase " except when upper case characters are included

" Indenting behavior
set copyindent
set preserveindent

" Change current directory to buffer's directory;
set autoread

" Break at word, not at charachter
set linebreak

" Every wrapped line will continue visually indented (same amount of space as
" the beginning of that line), thus preserving horizontal blocks of text.
set breakindent

" Remove all GUI elements
set guioptions-=egmrLtT

" Set font
set guifont=Ubuntu_Mono_for_Powerline:h12

" Current line number is absolute, other line numbers relative
set number relativenumber

" Wrapping
set nowrap

" No tabs, expand to spaces (2)
set expandtab
set shiftwidth=2

" Airline settings
set noshowmode " Airline already shows mode

" Filetype specific settings -----------------------

" LaTeX
autocmd BufRead *.tex
  \ setlocal wrap " visually wrap

" Overwrite airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}

  let g:airline_left_sep = '⮀'
  let g:airline_left_alt_sep = '⮁'
  let g:airline_right_sep = '⮂'
  let g:airline_right_alt_sep = '⮃'
  let g:airline_symbols.branch = '⭠'
  let g:airline_symbols.readonly = '⭤'
  let g:airline_symbols.linenr = '⭡'
endif

" Use space bar as leader
nnoremap <Space> <Nop>
let mapleader=" "
let maplocalleader=" "
let leader=" "

" Movement mappings
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

nnoremap <leader>sv :source $MYVIMRC<CR>

" Diffput and diffobtain
nnoremap <leader>dp :dp<cr>
nnoremap <leader>do :do<cr>
