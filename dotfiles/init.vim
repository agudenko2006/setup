set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set smartindent
set relativenumber nu
set scrolloff=4 hidden
set nohlsearch incsearch

call plug#begin() 
    Plug 'arcticicestudio/nord-vim'
    Plug 'rust-lang/rust.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'dag/vim-fish'
    Plug 'itchyny/lightline.vim'
call plug#end()

set noshowmode

colorscheme nord
set background=dark
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
"      \ 'separator': { 'left': '', 'right': '' },

let mapleader=" "

nnoremap <leader>en :setlocal spell! spelllang=en_us<CR>
nnoremap <leader>py :!clear&&python3 %:p<CR>
nnoremap <leader>rs :!clear&&cargo run %:p<CR>
nnoremap <leader>f :FZF<CR>
"switch between 2 files, h stands for history
nnoremap <leader>h <C-^>

nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>J yy p
nnoremap <leader>K yy P
