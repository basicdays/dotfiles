" Environment Setup
" =================
set runtimepath+=~/.config/nvim/bundle/neobundle.vim
" set runtimepath+=/usr/local/lib/python3.4/dist-packages/powerline/bindings/vim


" NeoVundle Settings
" ==================
call neobundle#begin(expand('~/.config/nvim/bundle'))

" let NeoVundle manage NeoVundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Usage
" NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'moll/vim-bbye'

" File Types
NeoBundle 'evanmiller/nginx-vim-syntax'
NeoBundle 'wting/rust.vim'
NeoBundle 'rodjek/vim-puppet'

" Revision Control
NeoBundle 'tpope/vim-fugitive'

" View
NeoBundle 'bling/vim-airline'
NeoBundle 'scrooloose/nerdtree'

" End Vundle Loader
call neobundle#end()
filetype plugin indent on
NeoBundleCheck


" airline
" =========
set laststatus=2
set noshowmode
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


" editor look
" ===========
set number
" set relativenumber
set showcmd
" set nowrap


" editor functionality
" ====================
" set undofile
set hidden
"set splitbelow
"set splitright


" search
" ======
"nnoremap / /\v
"vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch


" whitespace
" ==========
set list
set listchars=eol:‹,tab:›\ ,trail:·,extends:»,precedes:«,nbsp:¬


" tabs
" ====
set autoindent
" set noexpandtab
set copyindent
set preserveindent
" set softtabstop=0
set shiftwidth=0
set tabstop=4


" inputs
" =====
set mouse=a


" mappings
" ========
" cmap w!! w !sudo tee > /dev/null %
let mapleader = ","

" buffers/windows
nnoremap <leader>n :bnext<Enter>
nnoremap <leader>p :bprevious<Enter>
nnoremap <leader>c :bprevious\|bdelete #<Enter>

" copy/paste
vnoremap <leader>y "+y
vnoremap <leader>d "+d
" note: i_ctrl-q is an alternative to i_ctrl-v
" inoremap <C-v> <C-r><C-p>+

" misc
nnoremap <leader><space> :noh<Enter>

" terminal
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l


" syntax
" ======
syntax on

