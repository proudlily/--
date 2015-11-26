set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"...............
"语言的插件<language plugin>
"golang
Plugin 'fatih/vim-go'
Plugin 'junegunn/vim-plug'
Plugin 'Shougo/neocomplete.vim' "实时提示
"C语言插件
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
"......................
"vim-scripts repos
""vim-script背景
Plugin 'fatih/molokai'	
"安装 tagbar
Plugin 'jstemmer/gotags'  
Plugin 'majutsushi/tagbar'
"安装目录浏览器 nerdtree
Plugin 'scrooloose/nerdtree'
"........markdown插件

Plugin  'godlygeek/tabular'
Plugin  'plasticboy/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"............................
"插件的配置文件
colorscheme molokai  "安装 molokai 主题
"安装 tagbar
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

nmap <F8> :TagbarToggle<CR> 
"目录浏览器 nerdtree
map <C-n> :NERDTreeToggle<CR>

"golang配置
let g:neocomplete#enable_at_startup = 1 "neocomplete 实时提示
"vim-go
syntax enable
filetype plugin on
set number
let g:go_disable_autoinstall = 0
"neosnippet 插件
let g:go_snippet_engine = "neosnippet"

".................
"c LANGUAGE

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '/home/lily/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

"vim script....
"markdown插件
let g:vim_markdown_frontmatter=1

"...................................
"vim base设置
set nu  "显示行号
syntax on  "语法高亮
autocmd InsertLeave * se nocul "用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行 
set showcmd         " 输入的命令显示出来，看的清楚些
set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离
set foldenable      " 允许折叠  
set foldmethod=manual   " 手动折叠  
" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
set autowrite
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
"字体大小
set guifont=Monospace\ 12
