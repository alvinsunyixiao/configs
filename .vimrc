" Global leader
let mapleader = ','
" window switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" tabs
nnoremap <leader>t :tabnext<space>
nnoremap <S-l> :tabnext<cr>
nnoremap <S-h> :tabprevious<cr>

""""""""""""""""""
" vim-plug start "
""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Valloric/YouCompleteMe'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'heavenshell/vim-pydocstring', {'do': 'make install', 'for': 'python'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'tikhomirov/vim-glsl'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'lervag/vimtex'

call plug#end()
filetype plugin on
""""""""""""""""
" vim-plug end "
""""""""""""""""

" Nerdtree
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
let g:NERDTreeWinPos = "right"

" YCM
let g:ycm_confirm_extra_conf = 0

" Indent guide
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" Pydocstring
let g:pydocstring_doq_path = '~/.virtualenvs/doq/bin/doq'
let g:pydocstring_enable_mapping = 0
let g:pydocstring_formatter = 'google'

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0
set wildignore+=*/build/*

" Ack / ag
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" tmux color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" spell check color
let g:gruvbox_guisp_fallback='bg'

" Custom Configs
set number
colorscheme gruvbox
syntax on
set background=dark
set completeopt-=preview
set colorcolumn=80,100
set cmdheight=1
set backspace=eol,start,indent
set lazyredraw
set magic
set history=500
" search
set smartcase
set ignorecase
set hlsearch
set incsearch
" default indentation
set smarttab
set ai
set si
set wrap
set et
set sw=4
set sts=4
set ts=4
" swap dirs
set noswapfile
set nobackup
set undodir=~/.vim/tmp/.undo//
set undofile
" folding
set foldcolumn=1
set foldmethod=syntax
" spell-check

" remove trailing white space on save
autocmd FileType c,cpp,cuda,css,javascript,python,tex,yaml autocmd BufWritePre * %s/\s\+$//e

let g:go_version_warning=0

" python highlight
au FileType python syn keyword pythonDecorator True None False self

autocmd FileType cpp setlocal shiftwidth=2 softtabstop=2 tabstop=2 nofoldenable
autocmd FileType c setlocal shiftwidth=2 softtabstop=2 tabstop=2 nofoldenable
autocmd FileType cuda setlocal shiftwidth=2 softtabstop=2 tabstop=2 nofoldenable
autocmd FileType tex setlocal shiftwidth=2 softtabstop=2 tabstop=2 spell 
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4 nofoldenable

autocmd BufNewFile,BufFilePre,BufRead *.tpp set filetype=cpp
autocmd BufNewFile,BufFilePre,BufRead *.lcm set filetype=cpp

inoremap <expr> <BS> Delete()
function! Delete()
    let check_p = strpart(getline('.'), col('.')-2, 2)
    if check_p == "()" || check_p == "[]" || check_p == "{}"
        return "\<Right>\<BS>\<BS>"
    else
        return "\<BS>"
endfunction

inoremap        (    ()<Left>
inoremap        (<CR>  (<CR>)<Esc>O
inoremap        ((   (
inoremap <expr> )    strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

inoremap        [   []<Left>
inoremap        [[  [
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

inoremap        {      {}<Left>
inoremap        {<CR>  {<CR>}<Esc>O
inoremap        {{     {
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

