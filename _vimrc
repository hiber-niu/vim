set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=D:/vim/vimfiles/bundle/Vundle.vim/
call vundle#begin('D:/vim/vimfiles/bundle')
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'

Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'gcmt/wildfire.vim'
Plugin 'tpope/vim-commentary'
Plugin 'godlygeek/tabular'

Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Shougo/neocomplete.vim.git'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets'

"""python""""""
Plugin 'klen/python-mode'
Plugin 'yssource/python.vim'
Plugin 'python_match.vim'
Plugin 'pythoncomplete'
"""""""""""""""

"""javascript"""
Plugin 'elzr/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'briancollins/vim-jst'
Plugin 'kchmck/vim-coffee-script'
"""""""""""
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'luochen1990/rainbow'
" git YouCompleteMe is not working well on windows.
" Plugin 'Valloric/YouCompleteMe'

Plugin 'ervandew/supertab'
Plugin 'jsbeautify'
Plugin 'matchit.zip'
" 自动检测文件编码
"Plugin 'FencView.vim'
" vimwiki
Plugin 'vimwiki'
" 显示对齐线
Plugin 'nathanaelkane/vim-indent-guides'

" color theme
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'hukl/Smyck-Color-Scheme'

call vundle#end()


" scripts not on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" ...

filetype plugin indent on   " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line
"===================== vundle end ==============================

set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set fileencodings=ucs-bom,utf-8,cp936,gb2312,gb18030,big5,euc-jp,euc-kr,latin1,
if has("win32")
    "set guifont=Courier_New:h12:cANSI
    set guifont=Inconsolata_for_Powerline:h19:cANSI
    set guifontwide=Microsoft_YaHei_Mono:h13:cGB2312
endif

set wrap           " 自动换行
set expandtab       " 使用space代替tab
set tabstop=4       " 设置tab键的宽度
set backspace=2     " 设置退格键可用
set nu!             " 显示行号
set linebreak       " 整词换行
set whichwrap=b,s,<,>,[,]       " 光标从行首和行末时可以跳到另一行去
"set list                       " 显示制表符
"set listchars = tab:>-,trail:- " 将制表符显示为'>---',将行尾空格显示为'-'
"set listchars=tab:.\ ,trail:.   " 将制表符显示为'.   '
set autochdir                   " 自动设置目录为正在编辑的文件所在的目录
set hidden          " 没有保存的缓冲区可以自动被隐藏
set scrolloff=5
set guioptions-=T   "隐藏toolbar
set guioptions-=m   "隐藏menubar
set guioptions-=r   "隐藏右边的滚动条  
set guioptions-=L   "隐藏左边滚动条
"set nowrap         " 不自动折行
set textwidth=80    "80列自动添加换行符
set formatoptions+=mM "中文也自动换行
au GUIEnter * simalt ~x  "窗口启动最大化

" 窗口相关设置
noremap <C-TAB>   :bn<CR>
noremap <C-S-TAB> :bp<CR>

noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l

" 显示光标列
set cursorcolumn

" 删除文件尾部空行
autocmd FileType ruby,python autocmd BufWritePre <buffer> :%s/\($\n\s*\)\+\%$//e
"--------------------------------------------------------------------------------
" 查找/替换相关的设置
"--------------------------------------------------------------------------------
set hlsearch        " 高亮显示搜索结果
set incsearch       " 查询时非常方便，如要查找book单词，当输入到/b时，会自动找到
" 第一个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的
" 单词，依次类推，进行查找时，使用此设置会快速找到答案，当你
" 找要匹配的单词时，别忘记回车
" set gdefault        " 替换时所有的行内匹配都被替换，而不是只有第一个

"--------------------------------------------------------------------------------
" 状态栏相关的设置
"--------------------------------------------------------------------------------
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2    " always show the status line
set ruler           " 在编辑过程中，在右下角显示光标位置的状态行


"--------------------------------------------------------------------------------
" 编程相关的设置
"--------------------------------------------------------------------------------
set completeopt=longest,menu    " 关掉智能补全时的预览窗口
"execute pathogen#infect()   
let g:html_indent_inctags = "html,head,body,tbody,div"
"set tags=/home/nfs/microwindows/src/tags
syn on              " 打开语法高亮
set showmatch       " 设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set smartindent     " 智能对齐方式
set shiftwidth=4    " 换行时行间交错使用4个空格
set autoindent      " 自动对齐
set ai!             " 设置自动缩进
set cursorline      " 高亮当前行
"colorscheme solarized
"colorscheme wombat256
colorscheme molokai

"--------------------------------------------------------------------------------
" 代码折叠
"--------------------------------------------------------------------------------
"set foldmarker={,}
"set foldmethod=marker
set foldmethod=indent
set foldlevel=100       " Don't autofold anything (but I can still fold manually)
"set foldopen-=search   " don't open folds when you search into them
"set foldopen-=undo     " don't open folds when you undo stuff
"set foldcolumn=4

"--------------------------------------------------------------------------------
" 窗口操作的快捷键
"--------------------------------------------------------------------------------
nmap wv     <C-w>v     " 垂直分割当前窗口
nmap wc     <C-w>c     " 关闭当前窗口
nmap ws     <C-w>s     " 水平分割当前窗口

"--------------------------------------------------------------------------------
" vim-airline
"--------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#show_tab_type = 0
"let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'

"let g:airline_left_sep = '>>'
"let g:airline_left_alt_sep = '>>'
"let g:airline_right_sep = '<<'
"let g:airline_right_alt_sep = '<<'

"--------------------------------------------------------------------------------
" The-NERD-Commenter的设置
"--------------------------------------------------------------------------------
let mapleader=","

"--------------------------------------------------------------------------------
" The-NERD-Commenter的设置
"--------------------------------------------------------------------------------
let g:pymode_options = 0
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_run = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_run_bind = '<leader>r'
let g:pymode_folding  = 1
let g:pymode_rope = 1

let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 0
let g:pymode_rope_autoimport_import_after_complete = 0
" turn off pymode syntax checking.
let g:pymode_lint = 0
"let g:pymode_lint_on_write = 0
"let g:pymode_quickfix_minheight = 1
"let g:pymode_quickfix_maxheight = 3


"--------------------------------------------------------------------------------
" vim-wiki设置
"--------------------------------------------------------------------------------
" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1
let g:vimwiki_use_mouse = 1
let vimwiki_path = 'D:/gVimPortable/vimwiki/'
let vimwiki_html_path = 'D:/gVimPortable/vimwiki/html/'
let g:vimwiki_list = [{'path':vimwiki_path,
            \'path_html':vimwiki_html_path,
            \'template_path':vimwiki_html_path.'assets/',
            \'template_default':'default',
            \'template_ext':'.tpl',
            \'auto_export':0}]
nmap <leader>tt <Plug>VimwikiToggleListItem

""--------------------------------------------------------------------------------
"" jedi-vim设置
""--------------------------------------------------------------------------------
let g:jedi#completions_command = "<C-J>"

"--------------------------------------------------------------------------------
" Indent-Guides的设置
"--------------------------------------------------------------------------------
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup = 1

"--------------------------------------------------------------------------------
" Syntaxtic的设置
"--------------------------------------------------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"--------------------------------------------------------------------------------
" The-NERD-tree :NERDTreeToggle
"--------------------------------------------------------------------------------
nmap wm :NERDTreeToggle<cr> " 打开文件目录

"--------------------------------------------------------------------------------
" rainbow
"--------------------------------------------------------------------------------
let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}


"--------------------------------------------------------------------------------
" limit quickfix window height to 1 --> 2
"--------------------------------------------------------------------------------
au FileType qf call AdjustWindowHeight(1, 2)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

"--------------------------------------------------------------------------------
" windows下gvim设置
"--------------------------------------------------------------------------------
" {{{ Win平台下窗口全屏组件 gvimfullscreen.dll
" Alt + Enter 全屏切换
" Shift + t 降低窗口透明度
" Shift + y 加大窗口透明度
" Shift + r 切换Vim是否总在最前面显示
" Vim启动的时候自动使用当前颜色的背景色以去除Vim的白色边框
if has('gui_running') && has('gui_win32') && has('libcall')
    let g:MyVimLib = 'gvimfullscreen.dll'
    function! ToggleFullScreen()
        call libcall(g:MyVimLib, 'ToggleFullScreen', 1)
    endfunction

    let g:VimAlpha = 245
    function! SetAlpha(alpha)
        let g:VimAlpha = g:VimAlpha + a:alpha
        if g:VimAlpha < 180
            let g:VimAlpha = 180
        endif
        if g:VimAlpha > 255
            let g:VimAlpha = 255
        endif
        call libcall(g:MyVimLib, 'SetAlpha', g:VimAlpha)
    endfunction

    let g:VimTopMost = 0
    function! SwitchVimTopMostMode()
        if g:VimTopMost == 0
            let g:VimTopMost = 1
        else
            let g:VimTopMost = 0
        endif
        call libcall(g:MyVimLib, 'EnableTopMost', g:VimTopMost)
    endfunction
    "映射 Alt+Enter 切换全屏vim
    noremap <a-enter> :call ToggleFullScreen()<cr>
    "切换Vim是否在最前面显示
    "nmap <s-r> :call SwitchVimTopMostMode()<cr>
    "增加Vim窗体的不透明度
    nmap <s-t> :call SetAlpha(10)<cr>
    "增加Vim窗体的透明度
    nmap <s-y> :call SetAlpha(-10)<cr>
    " 默认设置透明
    autocmd GUIEnter * call libcallnr(g:MyVimLib, 'SetAlpha', g:VimAlpha)
endif
" }}}

"--------------------------------------------------------------------------------
" 在使用:bnext切换时排除quickfix
"--------------------------------------------------------------------------------
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

"--------------------------------------------------------------------------------
" 快速移动窗口
"--------------------------------------------------------------------------------
" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

"--------------------------------------------------------------------------------
" neocomplete 
"--------------------------------------------------------------------------------
let g:neocomplete#enable_at_startup = 1
