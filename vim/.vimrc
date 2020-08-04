set nu
syntax on
set fileencodings=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set fileformat=unix
set encoding=utf-8

set t_Co=256
set wildmenu
set nocompatible
set autoindent
set smartindent
set nobackup
set nowritebackup
set noswapfile
set ruler
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showmatch
set hlsearch
set backspace=indent,eol,start
set tags=tags;
set nocst


filetype on
filetype plugin on
filetype indent on

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"""" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'tczengming/autoload_cscope.vim'
Plugin 'Yggdroot/LeaderF'

"""" All of your Plugins must be added before the following line
call vundle#end()            " required
"" vim-go
let g:go_fmt_command = "goimports"
"
"" YCM settings
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['', '']
let g:ycm_key_invoke_completion = ''
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'go' : ['.'],
  \  }
"
" airline and airline_theme settings
set laststatus=2
let g:airline_exclude_preview = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='solarized_flood'
let g:airline_theme='light'

" for cscope
let g:autocscope_menus=0 

" for leaderf cuurrent directory file search
let g:Lf_UseVersionControlTool=0
let g:Lf_ShowDevIcons = 0
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowPosition = 'popup'
let g:Lf_WindowHeight=0.3
nnoremap <leader>c :LeaderfCommand<CR>
let g:Lf_WildIgnore = {
  \ 'dir': ['.svn','.git','.hg','.clangd','deps'],
  \ 'file': ['*.bak','*.o','.py[co]','.git*','.DS_Store']
  \}

" For tagbar golang
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" For TagBar cpp
let g:tagbar_type_cpp = {
            \ 'ctagstype' : 'c++',
            \ 'kinds'     : [
                \ 'd:macros:1:0',
                \ 'p:prototypes:1:0',
                \ 'g:enums',
                \ 'e:enumerators:0:0',
                \ 't:typedefs:0:0',
                \ 'n:namespaces',
                \ 'c:classes',
                \ 's:structs',
                \ 'u:unions',
                \ 'f:functions',
                \ 'm:members:0:0',
                \ 'v:variables:0:0'
            \ ],
            \ 'sro'        : '::',
            \ 'kind2scope' : {
                \ 'g' : 'enum',
                \ 'n' : 'namespace',
                \ 'c' : 'class',
                \ 's' : 'struct',
                \ 'u' : 'union'
            \ },
            \ 'scope2kind' : {
                \ 'enum'      : 'g',
                \ 'namespace' : 'n',
                \ 'class'     : 'c',
                \ 'struct'    : 's',
                \ 'union'     : 'u'
            \ }
        \ }

" For TagBar quick 
nmap <F8> :TagbarToggle<CR>
let g:tagbar_singleclick = 1

" For vim buffer 
nmap bn :bn<CR>
nmap bp :bp<CR>
nmap bd :bd<CR>

" for cscope nmap
" 查找符号出现的地方
nmap fs :cs find s <C-R>=expand("<cword>")<CR><CR>
" 查找函数、宏、枚举等定义的位置
nmap fg :cs find g <C-R>=expand("<cword>")<CR><CR>
" 查找文件名
nmap fn :cs find f <C-R>=expand("<cword>")<CR><CR>
" 查找光标下函数被调用的地方
nmap fc :cs find c <C-R>=expand("<cword>")<CR><CR>
" 查找当前函数调用的函数
nmap fd :cs find d <C-R>=expand("<cword>")<CR><CR>
" 查找指定的字符串出现的地方
nmap ft :cs find t <C-R>=expand("<cword>")<CR><CR>
" 查找当前文件名出现过的地方
nmap fi :cs find i <C-R>=expand("<cword>")<CR><CR>

" Auto find cscope.out 
if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=0
    set cst
    set csverb
    set cspc=3
    "add any database in current dir
    let cscope_file=findfile("cscope.out", ".;")
    let cscope_pre=matchstr(cscope_file, ".*/")
    if !empty(cscope_file) && filereadable(cscope_file)
	 	exe "silent! cs add" cscope_file cscope_pre
    endif
endif

" For NerdTree
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc','\~$','\.swp', '\.git']
" For only has nerdtree , just close it 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

