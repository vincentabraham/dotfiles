" Don't try to be vi compatible
set nocompatible
if &term == 'xterm-kitty'
    let &t_ut=''
endif

call plug#begin()
  " List your plugins here
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-vinegar'
  Plug 'catppuccin/vim', { 'as': 'catppuccin' }
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vhda/verilog_systemverilog.vim'
  Plug 'danilo-augusto/vim-afterglow'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
call plug#end()

" Turn on syntax highlighting
syntax on

" Automatic indentation
set autoindent
set termguicolors

" Dark mode
colorscheme afterglow
let g:afterglow_italic_comments=1
let g:airline_theme = 'afterglow'

" Light mode
" colorscheme catppuccin_latte
" let g:airline_theme = 'catppuccin_latte'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

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
nnoremap <C-e> :Explore<CR>
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

" Resize buffers
" noremap <C-p> :vertical resize +1<CR>
" noremap <C-o> :vertical resize -1<CR>
" noremap <C-i> :resize +1<CR>
" noremap <C-u> :resize -1<CR>

" commentary-vim (https://github.com/tpope/vim-commentary)
filetype plugin indent on
autocmd FileType verilog_systemverilog setlocal commentstring=//\ %s
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType cc setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s
set noshowmode

" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>

" fzf mappings
" nnoremap <C-p> :GFiles<Cr>
