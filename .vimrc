" Don't try to be vi compatible
set nocompatible

" Turn on syntax highlighting
syntax on

" Automatic indentation
set autoindent

" Change cursor in different modes

" Security
set modelines=0

" Hybrid line numbers
" set number relativenumber
set number

" Show file stats
set ruler

" Automatic closing pairs
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>

" Encoding
set encoding=utf-8

" Whitespace
" set wrap
" set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Map the Explore command
nnoremap <C-e> :Lexplore<CR>
" Buffer navigation
nnoremap <C-h> :bp<CR>
nnoremap <C-l> :bn<CR>

" Set Vim's current directory to the opened buffer
set autochdir

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttimeout
set ttimeoutlen=1
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Change how the cursor looks in insert and command mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
