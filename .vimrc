set nocompatible

execute pathogen#infect()

" Git commit messages wrapping
" gq<motion> / visual mode selection + gq reformat existing text
au FileType gitcommit set tw=72
au FileType gitcommit set cc=72

" Syntax highlighting
filetype plugin indent on
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.rabl setf ruby
syntax on

" Leader comma
let mapleader = ","

" Command line completion
set wildmenu

" Search related
set hlsearch
set ignorecase
set incsearch
"Reset highlighted search when ENTER is pressed
nnoremap <silent> <CR> :let @/=""<CR><CR>

" Solarized dark
syntax enable
set background=dark
colorscheme solarized

" Line numbers
set number

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

" Status Line and vim-airline
set laststatus=2
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>
let g:NERDTreeWinSize=50

" Smooth scrolling
noremap <silent> <c-k> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-j> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Syntastic - syntax checker
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" maps jj to  esc so I can exit insert mode quicker
ino jj <esc>
cno jj <c-c>

" ctrl-d to go to shell and come back
noremap <C-d> :sh<cr>

" use ; instead of :
nnoremap ; :

" use ag on ack.vim if ag is available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

set noswapfile

" Keep 3 lines below and above the cursor
set scrolloff=10
