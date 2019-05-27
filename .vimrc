set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'myusuf3/numbers.vim'
Plug 'ervandew/supertab'
Plug 'vim-scripts/Syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'elixir-lang/vim-elixir'
Plug 'tpope/vim-fugitive'
Plug 'jparise/vim-graphql'
Plug 'mhinz/vim-mix-format'
Plug 'leafgarland/typescript-vim'
call plug#end()

" Leader comma
let mapleader = ","

" Syntax highlighting
filetype plugin indent on
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.rabl setf ruby
syntax on

" No annoying swap files
set noswapfile

" Command line completion
set wildmenu

" Search related
set hlsearch
set ignorecase
set incsearch

" Reset highlighted search when ENTER is pressed
nnoremap <silent> <CR> :let @/=""<CR><CR>

" Solarized dark
syntax enable
set background=dark
colorscheme solarized

" Line numbers
set number

" Always keep at least 10 lines below and above the cursor when scrolling
set scrolloff=10

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype go setlocal noexpandtab tabstop=2 shiftwidth=2 softtabstop=2

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Buffers
set hidden
nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

" Quicker movement across buffers
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Open new split panes to right/bottom, which feels more natural
set splitbelow
set splitright

" Statusline and vim-airline
set laststatus=2
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>
let g:NERDTreeWinSize=50

" ctrl-d to go to shell and come back with same keys
noremap <C-d> :sh<cr>

" use ag on ack.vim if ag is available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Git commit messages wrapping
" gq<motion> / visual mode selection + gq reformat existing text
au FileType gitcommit set tw=72
au FileType gitcommit set cc=72

" fzf instead of command-t
nmap <leader>t :Files<cr>

" Some handy abbreviations
:iabbrev pry!! require "pry"; binding.pry
:iabbrev iex!! require IEx; IEx.pry

" Run Elixir's `mix format` on save
let g:mix_format_on_save = 1

setlocal foldmethod=expr
setlocal foldexpr=elixir#folding#elixir_folds(v:lnum)
