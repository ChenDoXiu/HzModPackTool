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
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'mattn/emmet-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'groenewege/vim-less'
Plug 'Raimondi/delimitMate'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'marijnh/tern_for_vim'
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'maksimr/vim-jsbeautify'
Plug 'Chiel92/vim-autoformat'
Plug 'w0rp/ale'
Plug 'jvanja/vim-bootstrap4-snippets'
"Plug 'katosun2/imiku-vim-less'
Plug 'turbio/bracey.vim'
Plug 'yegappan/taglist'
Plug 'posva/vim-vue'
call plug#end()
"-----vue----

autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.css
" let g:syntastic_javascript_checkers = ['eslint']

"--------注释--------------
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = {
            \ 'javascript': { 'left': '//', 'leftAlt': '/**', 'rightAlt': '*/' },
            \ 'less': { 'left': '/**', 'right': '*/' }
        \ }

let g:NERDAltDelims_javascript = 1
let g:NERDDefaultNesting = 0
" # <leader>c<space> 注释/取消注释
" # <leader>cc // 注释
" # <leader>cm 只用一组符号注释
" # <leader>cA 在行尾添加注释
" # <leader>c$ /* 注释 */
" # <leader>cs /* 块注释 */
" # <leader>cy 注释并复制
" # <leader>ca 切换　// 和 /* */
" # <leader>cu 取消注释
"-------- nerd tree --------
"autocmd vimenter * NERDTree

map <C-n> :NERDTreeToggle<CR>
"---------tags-------------
set tags=tags;
set autochdir
"---------主题-------------
" set background=dark
set background=dark
"colorscheme jellybeans
"-------js-beautify------
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
"-------css color--------
augroup VimCSS3Syntax
  autocmd! 

  autocmd FileType css setlocal iskeyword+=-
augroup END

"-------ycm----------------
let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_complete_in_strings = 1
let g:ycm_complete_in_comments = 1
let g:ycm_key_list_select_completion = ['<Tab>', '<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.'],
            \   'objc' : ['->', '.'],
            \   'ocaml' : ['.', '#'],
            \   'cpp,objcpp' : ['->', '.', '::'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::', '(', 'use ', 'namespace ', '\'],
            \   'cs,java,typescript,d,python,perl6,scala,vb,elixir,go' : ['.', 're!(?=[a-zA-Z]{3,4})'],
            \   'html': ['<', '"', '</', ' '],
            \   'vim' : ['re![_a-za-z]+[_\w]*\.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \   'haskell' : ['.', 're!.'],
            \   'css': [ 're!^\s{2,4}', 're!:\s+' ],
            \   'javascript': ['.', 're!(?=[a-zA-Z]{3,4})'],
            \ }



"--------javascript--------
let javascript_enable_domhtmlcss = 1
"-----------php-----------
filetype plugin on                                             
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"------------ycm and ult------------
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif
if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
"-------------less-----------------
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>
"-------------python---------------
let python_highlight_all=1
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set textwidth=79
au Filetype python set expandtab
au Filetype python set autoindent
au Filetype python set fileformat=unix
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99



map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!clear"
                exec "!time python3 %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
        endif
      endfunc
nnoremap <F6> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

"----tern----
let tern_show_signature_in_pum = 1
let tern_show_argument_hints = 'on_hold'
autocmd FileType javascript nnoremap <leader>d :TernDef<CR>
autocmd FileType javascript setlocal omnifunc=tern#Complete

