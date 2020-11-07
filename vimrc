noremap j k
noremap k j
map S :w<CR>
map Q :q<CR>
set foldmethod=indent
set mouse=a
set noswapfile
"set tags=tags;
"set autochdir
"---------中文化-------------
"禁用VI兼容模式 

set nocompatible     

"Vim 的内部编码

set encoding=utf-8         

"Vim 在与屏幕/键盘交互时使用的编码(取决于实际的终端的设定)

set termencoding=utf-8          

"Vim 当前编辑的文件在存储时的编码


set fileencoding=utf-8     

"Vim 打开文件时的尝试使用的编码

set fileencodings=ucs-bom,utf-8,gbk,default,latin1 

"设置中文帮助

set helplang=cn

"根据文件类型设置缩进格式
set hlsearch
set incsearch
" set relativenumber
au FileType html,python,vim,javascript setl shiftwidth=2

au FileType html,python,vim,javascript setl tabstop=2

au FileType java,php setl tabstop=2

"--------弹出补全颜色--------
hi Pmenu ctermbg=gray

"-----------基础配置-----------
set sw=2
set ts=2
set expandtab autoindent
set number
set ruler
set cursorline
set showmode
let mapleader=","
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'w0rp/ale'
Plug 'turbio/bracey.vim'
Plug 'mhartington/vim-typings'
call plug#end()

"-------- nerd tree --------
map <C-n> :NERDTreeToggle<CR>

