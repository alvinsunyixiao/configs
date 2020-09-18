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

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'morhetz/gruvbox'

Plugin 'itchyny/lightline.vim'

Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
let g:NERDTreeWinPos = "right"

Plugin 'Valloric/YouCompleteMe'
let g:ycm_confirm_extra_conf = 0

Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

Plugin 'tpope/vim-fugitive'

Plugin 'vim-scripts/DoxygenToolkit.vim'

Plugin 'heavenshell/vim-pydocstring'
let g:pydocstring_enable_mapping = 0
let g:pydocstring_formatter = 'google'

Plugin 'heavenshell/vim-jsdoc'

Plugin 'iamcco/markdown-preview.vim'

Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}

Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0
set wildignore+=*/build/*,*/graveyard/*,*/third_party/*,*.so,*.a

Plugin 'mileszs/ack.vim'
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'MaxMEllon/vim-jsx-pretty'

Plugin 'tikhomirov/vim-glsl'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set number
colorscheme gruvbox
syntax on
set background=dark
set completeopt-=preview
set colorcolumn=100
set cmdheight=1
set backspace=eol,start,indent
set lazyredraw
set magic
set history=500
" tmux color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
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
" remove trailing white space on save
autocmd FileType c,cpp,cuda,css,javascript,python,tex,yaml autocmd BufWritePre * %s/\s\+$//e

let g:go_version_warning=0

" python highlight
au FileType python syn keyword pythonDecorator True None False self

autocmd FileType cpp setlocal shiftwidth=2 softtabstop=2 tabstop=2 nofoldenable
autocmd FileType cuda setlocal shiftwidth=2 softtabstop=2 tabstop=2 nofoldenable
autocmd FileType tex setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4 nofoldenable

autocmd BufNewFile,BufFilePre,BufRead *.tpp set filetype=cpp
autocmd BufNewFile,BufFilePre,BufRead *.lcm set filetype=cpp

inoremap        (    ()<Left>
inoremap        (<CR>  (<CR>)<Esc>O
inoremap        ((   (
inoremap <expr> )    strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

inoremap <expr> <BS> Delete()
function! Delete()
    let check_p = strpart(getline('.'), col('.')-2, 2)
    if check_p == "()" || check_p == "[]" || check_p == "{}"
        return "\<Right>\<BS>\<BS>"
    else
        return "\<BS>"
endfunction

inoremap        [   []<Left>
inoremap        [[  [
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

inoremap        {      {}<Left>
inoremap        {<CR>  {<CR>}<Esc>O
inoremap        {{     {
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"


