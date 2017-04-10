" Essentials
set nocompatible
filetype off

" Load plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ervandew/supertab'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-markdown'
Plugin 'fidian/hexmode'
call vundle#end()

syntax on
filetype plugin indent on

" Most important asthestic stuff
set t_Co=256
colorscheme wellsokai
set guifont=Ubuntu\ Mono\ 12

" Airline
let g:airline_theme='powerlineish' " Colors same as original powerline
let g:airline#extensions#tabline#enabled = 1 " Show files in buffer like a standard tab
let g:airline_powerline_fonts = 0
" quick change between buffers
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#enabled = 0
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
"configure separators for the tabline only. >
  let g:airline#extensions#tabline#left_sep = '|'
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#right_sep = ''
  let g:airline#extensions#tabline#right_alt_sep = ''
" separators and symbols
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.paste = 'p'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_section_y=''
let g:airline_section_x='%{getcwd()}'

" Easy Motion
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s)

" Tmux integration
let g:tmux_navigator_no_mappings = 1
" Ctrl h, j, k, l
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Copy and paste
map <leader>pp :setlocal paste!<cr>
set clipboard+=unnamed
" Copy to buffer
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/.vimbuffer<CR>
" Paste from buffer
map <C-p> :r ~/.vimbuffer<CR>

" Search
set incsearch
set hidden    
set ignorecase
set smartcase  " Case-insensitive (unless a capital letter is used)
set showmatch

" Menu
set wildmenu
set wildmode=full
set wildignorecase
set encoding=utf-8

" Saving
command Plz w !sudo tee % > /dev/null

" Editing
set expandtab
set shiftwidth=4
set softtabstop=4
" Toggle comment line
map <C-_> gcl

" Window management
set splitbelow
set splitright

" Persist history
set nobackup                " Don't keep a backup file
set viminfo='20,\"90,h,%    " read/write a .viminfo file

" Misc
set laststatus=2 " Ensure status bar shows up
set ttimeoutlen=50 " Ensure quick switch from insert to normal=1
set noshowmode
set autowrite
set nosol " Prevent the cursor from changing the current column when jumping to other lines within the window
if !has('nvim')
    set ttymouse=xterm2
endif

" Path
au BufRead,BufNewFile *.h set filetype=fortran
