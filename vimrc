set modeline
set cursorline
set wildmenu
set clipboard^=unnamedplus
set title
set titleold=
set pastetoggle=<F2>
set background=dark

set nobackup
set noswapfile

set laststatus=2

set ignorecase
set smartcase
set incsearch
set hlsearch

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set autoindent

set splitright

set nofixendofline

syntax on

let mapleader=" "

let g:netrw_bufsettings = 'noma nomod nobl nowrap ro'

let g:netrw_winsize = -28
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3

highlight VertSplit     cterm=none ctermfg=none ctermbg=none

nnoremap q: <nop>
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprev<CR>
nnoremap <LEADER>e :edit **/
nnoremap <LEADER>t :tabnew **/
nnoremap <LEADER>n :tabnew<CR>
nnoremap <LEADER>h :nohlsearch<CR>
nnoremap <LEADER>§ :tabnew \| terminal ++curwin ++close<CR>
nnoremap <LEADER><Tab> :vsplit \| terminal ++curwin ++close<CR>
nnoremap <LEADER>r :so ~/.vimrc<CR>
nnoremap <LEADER>s :%s/\s\+$//gc<CR>

nnoremap <LEADER>v :tabnew ~/.vimrc<CR>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

vnoremap < <gv
vnoremap > >gv

map <F9> :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
map <F10> :set number!<Bar>set number?<CR>
map <F12> :0tabnew <bar> :Ex<CR>
