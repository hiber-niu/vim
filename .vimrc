" -----------------------------------------------------------------------------
"  < 判断操作系统是否是 Windows 还是 Linux >
" -----------------------------------------------------------------------------
let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

" auto install plug.vim
if (g:islinux)
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
    call plug#begin('~/.vim/plugged')
else
    call plug#begin('~/vimfiles/plugged')
endif
" windows
" md ~\vimfiles\autoload
" $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" (New-Object Net.WebClient).DownloadFile(
"   $uri,
"   $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\vimfiles\autoload\plug.vim")
" )

" Plugins from github repos:
" Better file browser
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
" Code commenter
Plug 'scrooloose/nerdcommenter'
" Code and files fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Consoles as buffers
"Plug 'rosenfeld/conque-term'
" Pending tasks list
"Plug 'fisadev/FixedTaskList.vim'
" Surround
Plug 'tpope/vim-surround'
" table
" Plug 'dhruvasagar/vim-table-mode'
Plug 'jiangmiao/auto-pairs'
" Indent text object
Plug 'michaeljsmith/vim-indent-object'
" Handle TAB confilict of neocomplete and snippets
Plug 'ervandew/supertab'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Plug 'klen/python-mode', {'for': 'py'}
" Better autocompletion
" Snippets manager (SnipMate), dependencies, and snippets repo
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'w0rp/ale', {'for': 'py'}
" Paint css colors with the real color
Plug 'lilydjwg/colorizer'

" XML/HTML tags navigation
Plug 'vim-scripts/matchit.zip', {'for': 'html'}
" Yank history navigation
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'luochen1990/rainbow'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'justinmk/vim-sneak'
Plug 'Chiel92/vim-autoformat'
" json"
Plug 'elzr/vim-json'

" python 
Plug 'davidhalter/jedi-vim'

" markdown
Plug 'godlygeek/tabular', {'for': 'md'} | Plug 'plasticboy/vim-markdown', {'for': 'md'}
" color theme
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'

call plug#end()

" ============================================================================
" Vim settings and mappings
" You can edit them as you wish
set shell=/bin/bash

set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set fileencodings=utf-bom,utf-8,cp936,gb2312,gb18030,big5,euc-jp,euc-kr,latin1,
set enc=utf8

if (g:islinux)
    set guifont=Monospace\ 14
else
    set backspace=indent,eo1,start "避免backspace失效"
    set guifont=Consolas:h16:cANSI
endif

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" always show status bar
set ls=2

" incremental search
set incsearch
" highlighted search results
set hlsearch

"set autochdir "自动设置目录为正在编辑的文件所在的目录 
"有些插件与这个命令会有冲突导致无法起作用，需要执行如下命令。
autocmd BufEnter * lcd %:p:h

" 删除文件尾部空行
autocmd FileType ruby,python autocmd BufWritePre <buffer> :%s/\($\n\s*\)\+\%$//e

" syntax highlight on
syntax on

" show line numbers
set nu

set linebreak

set guioptions-=T   "隐藏toolbar
set guioptions-=m   "隐藏menubar
set guioptions-=r   "隐藏右边的滚动条  
set guioptions-=L   "隐藏左边滚动条

set textwidth=80    "80列自动添加换行符
set formatoptions+=tmM "中文也自动换行
let autosave=30     " 30s自动保存 

" automaximize windo when startup
if has("gui_running")
    if (g:iswindows)
        au GUIEnter * simalt ~x
    else
        set lines=300 columns=300
    endif
endif


" ==============Json=========
setlocal foldmethod=syntax
command! Jsonf :execute '%!python -m json.tool'
  \ | :execute '%!python -c "import re,sys;sys.stdout.write(re.sub(r\"\\\u[0-9a-f]{4}\", lambda m:m.group().decode(\"unicode_escape\").encode(\"utf-8\"), sys.stdin.read()))"'
"
" ========================
" markdown
let g:vim_markdown_folding_disabled = 1
set conceallevel=2

"--------------------------------------------------------------------------------
" The-NERD-Commenter的设置
"--------------------------------------------------------------------------------
let mapleader=","

" 窗口相关设置
noremap <C-TAB>   :bn<CR>
noremap <C-S-TAB> :bp<CR>

noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l
" 显示光标列
set cursorcolumn

" Comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
set completeopt-=preview

" save as sudo
ca w!! w !sudo tee "%"

" simple recursive grep
" both recursive grep commands with internal or external (fast) grep
command! -nargs=1 RecurGrep lvimgrep /<args>/gj ./**/*.* | lopen | set nowrap
command! -nargs=1 RecurGrepFast silent exec 'lgrep! <q-args> ./**/*.*' | lopen
" mappings to call them
nmap ,R :RecurGrep 
nmap ,r :RecurGrepFast 
" mappings to call them with the default word as search text
nmap ,wR :RecurGrep <cword><CR>
nmap ,wr :RecurGrepFast <cword><CR>

" use 256 colors when possible
if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
	let &t_Co = 256
    colorscheme molokai
else
    colorscheme molokai
endif

" colors for gvim
if has('gui_running')
    "colorscheme wombat
    colorscheme molokai
    "set background=dark
    "colorscheme solarized
endif

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" Tagbar ----------------------------- 

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

"--------------------------------------------------------------------------------
" 窗口操作的快捷键
"--------------------------------------------------------------------------------
nmap wv     <C-w>v     " 垂直分割当前窗口
nmap wc     <C-w>c     " 关闭当前窗口
nmap ws     <C-w>s     " 水平分割当前窗口

" NERDTree ----------------------------- 

" toggle nerdtree display
nmap wm :NERDTreeToggle<cr> " 打开文件目录
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" nerdcommenter ------------------------"

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"--------------------------------------------------------------------------------
" 快速移动窗口
"--------------------------------------------------------------------------------
" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

"--------------------------------------------------------------------------------
" rainbow
"--------------------------------------------------------------------------------
let g:rainbow_active = 1
" Tasklist ------------------------------

" show pending tasks list
map <F2> :TaskList<CR>


" CtrlP ------------------------------

" file finder mapping
let g:ctrlp_map = ',e'
" tags (symbols) in current file finder mapping
nmap ,g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap ,f :CtrlPLine<CR>
" recent files finder mapping
nmap ,m :CtrlPMRUFiles<CR>
" commands finder mapping
nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" same as previous mappings, but calling with current word as default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder

" Python-mode ------------------------------
let g:pymode = 1
" Trim unused white spaces on save   
let g:pymode_trim_whitespaces = 1

" Setup default python options     
let g:pymode_options = 1
let g:pymode_python = 'python3'
" Enable pymode folding                           
let g:pymode_folding = 0
" Enable pymode-motion                                         *'g:pymode_motion'*
let g:pymode_motion = 1
" Turn on the run code script                                     *'g:pymode_run'*
let g:pymode_run = 1
" Binds keys to run python code                              *'g:pymode_run_bind'*
let g:pymode_run_bind = '<leader>r'
" Turn on code checking                                          *'g:pymode_lint'*
let g:pymode_lint = 0
" Check code on every save (if file has been modified)  *'g:pymode_lint_on_write'*
let g:pymode_lint_on_write = 1
" E.g. "E501,W002", "E2,W" (Skip all Warnings and Errors that starts with E2) and etc
let g:pymode_lint_ignore = "W"
" Auto open cwindow (quickfix) if any errors have been found
let g:pymode_lint_cwindow = 1
let g:pymode_quickfix_minheight = 1
let g:pymode_quickfix_maxheight = 3

let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
" Turn on the rope script                                        *'g:pymode_rope'*
let g:pymode_rope = 0
" Enable searching for |.ropeproject| in parent directories
let g:pymode_rope_lookup_project = 0
" Turn on code completion support in the plugin       *'g:pymode_rope_completion'*
let g:pymode_rope_completion = 0
" Turn on autocompletion when typing a period
let g:pymode_rope_complete_on_dot = 0
" Keymap for autocomplete                        *'g:pymode_rope_completion_bind'*
let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_rope_goto_definition_bind = ',d'
" 启用内置python文档，使用K进行查找
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
"python-mode设置了不自动换行显示，打开好
au BufNewFile,BufRead *.py set wrap

" Airline ------------------------------

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
"let g:airline#extensions#whitespace#enabled = 0

"--------------------------------------------------------------------------------
" Indent-Guides的设置
"--------------------------------------------------------------------------------
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup = 1

"--------------------------------------------------------------------------------
" limit quickfix window height to 1 --> 2
"--------------------------------------------------------------------------------
au FileType qf call AdjustWindowHeight(1, 2)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction
"
"--------------------------------------------------------------------------------
" 在使用:bnext切换时排除quickfix
"--------------------------------------------------------------------------------
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

" Ultisnips----------------------------------------------
"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:snips_author="hiber"
let g:snips_email="niuhaibo@xiaomi.com"
let g:snips_github="https://github.com/hiber-niu"

" ale config---------------------------------------------
" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0

"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap ep <Plug>(ale_previous_wrap)
nmap en <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>

" 关闭当前缓冲区----------------------------------------
nmap ww :bdelete<CR>

" vim-sneak---------------------------------------------
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" autorun-------------------------------------------------
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

" auto format-------------------------------------------
nnoremap <F6> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

