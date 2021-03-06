call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-scripts/genutils'
Plug 'vim-scripts/lookupfile'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/echofunc.vim'
Plug 'vim-scripts/ShowFunc.vim'
"Plug 'jiangmiao/auto-pairs'
Plug 'ycm-core/YouCompleteMe'
Plug 'Yggdroot/indentLine'
Plug 'tenfyzhong/CompleteParameter.vim'
call plug#end()



"----------------------------------------------------
"                    indentLine
"----------------------------------------------------
let g:indentLine_enabled = 1

"----------------------------------------------------
"                   YouCompleteMe
"----------------------------------------------------
let g:ycm_server_python_interpreter = '/usr/bin/python2.7'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0                  " 关闭语法提示
let g:ycm_complete_in_comments=1                   " 补全功能在注释中同样有效
let g:ycm_min_num_identifier_candidate_chars = 2   " 最低字符开始匹配
let g:ycm_cache_omnifunc = 0                       "禁止缓存,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax = 1         " 语法关键字补全
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_server_log_level = 'info'
let g:ycm_collect_identifiers_from_comments_and_string = 1
let g:ycm_complete_in_string = 1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone
noremap <c-z> <NOP>
let g:ycm_semantic_triggers = {'c,cpp,python,java,go,erlang,perl' : ['return!\w{2}'],'cs,lua,javascript' : ['return!\w{2}'],}
let g:ycm_autoclose_preview_window_after_insertion = 1

"et g:AutoPairs = {'[':']','(':')','{':'}',"'":"'",'"':'"', '`':'`'}

"----------------------------------------------------
"                  set ctags bin dir 
"----------------------------------------------------
"let g:showfuncctagsbin = '/usr/bin/ctags'

" 定义快捷键到行首和行尾

nmap LH 0
nmap LT $

" 代码折叠
set foldmethod=manual

" 比较习惯用;作为命令前缀，右手小拇指直接能按到
let mapleader = ";"    

" 把空格键映射成:
nmap <space> :

" 快捷打开编辑vimrc文件的键盘绑定
map <silent> <leader>ee :e $HOME/.vimrc<cr>
autocmd! bufwritepost *.vimrc source $HOME/.vimrc
" ^z快速进入shell
"nmap <C-Z> :shell<cr>

" 判断操作系统
if (has("win32") || has("win64") || has("win32unix"))
    let g:isWin = 1
else
    let g:isWin = 0
endif

" 判断是终端还是gvim
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif
set nocompatible    " 关闭兼容模式
syntax enable       " 语法高亮
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on  " 文件类型插件
filetype indent on
set autoindent
autocmd BufEnter * :syntax sync fromstart
set nu              " 显示行号
set showcmd         " 显示命令
set lz              " 当运行宏时，在命令执行完成之前，不重绘屏幕
set hid             " 可以在没有保存的情况下切换buffer
set backspace=eol,start,indent
set whichwrap+=<,>,h,l " 退格键和方向键可以换行
set incsearch       " 增量式搜索
set hlsearch        " 高亮搜索
" set ignorecase      " 搜索时忽略大小写
set magic           " 额，自己:h magic吧，一行很难解释
set showmatch       " 显示匹配的括号
set nobackup        " 关闭备份
set nowb
set noswapfile      " 不使用swp文件，注意，错误退出后无法恢复
set lbr             " 在breakat字符处而不是最后一个字符处断行
set ai              " 自动缩进
set si              " 智能缩进
set cindent         " C/C++风格缩进
set wildmenu
set nofen
set fdl=10
" tab转化为4个字符
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
" 不使用beep或flash
set vb t_vb=
set background=dark
colorscheme desert
"colorscheme dracula
"set t_Co=256
set history=400  " vim记住的历史操作的数量，默认的是20
set autoread     " 当文件在外部被修改时，自动重新读取
set mouse=a      " 在所有模式下都允许使用鼠标，还可以是n,v,i,c等
"在gvim中高亮当前行
if (g:isGUI)
    set cursorline
    hi cursorline guibg=#333333
    hi CursorColumn guibg=#333333
    set guifont=Consolas\ 14
    set guifontwide=Consolas\ 14
endif
" 设置字符集编码，默认使用utf8
if (g:isWin)
    let &termencoding=&encoding " 通常win下的encoding为cp936
    set fileencodings=utf8,cp936,ucs-bom,latin1
else
    set encoding=utf8
    set fileencodings=utf8,gb2312,gb18030,ucs-bom,latin1
endif
" 状态栏
set laststatus=2      " 总是显示状态栏
highlight StatusLine cterm=bold ctermfg=black ctermbg=yellow
" 获取当前路径，将$HOME转化为~
function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "g")
    return curdir
endfunction
"set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\
" 第80列往后加下划线
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
" 根据给定方向搜索当前光标下的单词，结合下面两个绑定使用
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n{1}quot;, "", "")
    if a:direction == 'b'
        execute "normal ?" . l:pattern . "<cr>"
    else
        execute "normal /" . l:pattern . "<cr>"
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
" 用 */# 向 前/后 搜索光标下的单词
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" 在文件名上按gf时，在新的tab中打开
map gf :tabnew <cfile><cr>

" 用c-j,k在buffer之间切换
nn <C-J> :bn<cr>
nn <C-K> :bp<cr>
nn <C-H> :b1<cr>

" Bash(Emacs)风格键盘绑定
imap <C-e> <END>
imap <C-a> <HOME>
"imap <C-u> <esc>d0i
"imap <C-k> <esc>d$i  " 与自动补全中的绑定冲突

" 恢复上次文件打开位置
"set viminfo='10,\"100,:20,%,n~/.viminfo
"au BufReadPost if line("'\"") > 0|if line("'\"") <= line("{1}quot;)|exe("norm '\"")|else|exe "norm {1}quot;|endif|endif

" 删除buffer时不关闭窗口
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")
    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif
    if bufnr("%") == l:currentBufNum
        new
    endif
    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction
" 快捷输入
" 自动完成括号和引号
inoremap <leader>1 ()<esc>:let leavechar=")"<cr>i
inoremap <leader>2 []<esc>:let leavechar="]"<cr>i
inoremap <leader>3 {}<esc>:let leavechar="}"<cr>i
inoremap <leader>4 {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap <leader>q ''<esc>:let leavechar="'"<cr>i
inoremap <leader>w ""<esc>:let leavechar='"'<cr>i

" 缩写
iab idate <c-r>=strftime("%Y-%m-%d")<CR>
iab itime <c-r>=strftime("%H:%M")<CR>
iab idatetime <c-r>=strftime("%Y-%m-%d %H:%M")<CR>
iab imail lichunjun@edan.com.cn
iab iname Chunjun Li
iab iauth Chunjun Li <lichunjun@orvibo.com>
iab ifile <C-R>=expand("%:t")<CR>
" 插件窗口的宽度，如TagList,NERD_tree等，自己设置
let s:PlugWinSize = 30
" ShowFunc.vim  <-------- 暂时没有使用
" http://www.vim.org/scripts/script.php?script_id=397
" F2打开ShowFunc TagList窗口，显示C/C++函数原型
" map <F2> <Plug>ShowFunc
" map! <F2> <Plug>ShowFunc
" taglist.vim
" http://www.vim.org/scripts/script.php?script_id=273
" <leader>t 打开TagList窗口，窗口在右边
nmap <silent> <leader>t :TlistToggle<cr>
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 0
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 0
let Tlist_WinWidth = s:PlugWinSize
let Tlist_Auto_Open = 0
let Tlist_Display_Prototype = 0
"let Tlist_Close_On_Select = 1
" configure tags - add additional tags here or comment out not-used ones
" set tags+=~/.vim/tags/cpp
" set tags+=~/.vim/tags/qt4
" set tags+=~/.vim/tags/gl
" set tags+=~/.vim/tags/sdl
" set tags+=~/.vim/tags/boost
" build tags of your own project with Ctrl+F12
map <F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

" c-j自动补全，当补全菜单打开时，c-j,k上下选择
imap <expr> <c-j>      pumvisible()?"\<C-N>":"\<C-X><C-O>"
imap <expr> <c-k>      pumvisible()?"\<C-P>":"\<esc>"

" f:文件名补全，l:行补全，d:字典补全，]:tag补全
imap <C-]>             <C-X><C-]>
imap <C-F>             <C-X><C-F>
imap <C-D>             <C-X><C-D>
imap <C-L>             <C-X><C-L>

" NERD_commenter.vim
" http://www.vim.org/scripts/script.php?script_id=1218
" Toggle单行注释/“性感”注释/注释到行尾/取消注释
map <leader>cc ,c<space>
map <leader>cs ,cs
map <leader>c$ ,c$
map <leader>cu ,cu
" NERD tree
" http://www.vim.org/scripts/script.php?script_id=1658
let NERDTreeShowHidden = 1
let NERDTreeWinPos = "right"
let NERDTreeWinSize = s:PlugWinSize
nmap <leader>n :NERDTreeToggle<cr>

" 更新ctags和cscope索引
" href: http://www.vimer.cn/2009/10/把vim打造成一个真正的ide2.html
" 稍作修改，提取出DeleteFile函数，修改ctags和cscope执行命令
map <c-\> :call ReflashTagsAndCscope()<cr>
function! ReflashTagsAndCscope()
    let dir = getcwd()
    "先删除已有的tags和cscope文件，如果存在且无法删除，则报错。
    if ( DeleteFile(dir, "tags") )
        return
    endif
    if ( DeleteFile(dir, "cscope.*") )
        return
    endif
    if(executable('ctags'))
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        if(g:isWin)
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        else
            silent! execute "!find . -iname '*.[ch]' -o -name '*.cpp' > cscope.files"
        endif
        silent! execute "!cscope -bkq"
        silent! execute "!rm cscope.files"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
    " 刷新屏幕
    execute "redr!"
endfunction
function! DeleteFile(dir, filename)
    if filereadable(a:filename)
        if (g:isWin)
            let ret = delete(a:dir."\\".a:filename)
        else
            let ret = delete("./".a:filename)
        endif
        if (ret != 0)
            echohl WarningMsg | echo "Failed to delete ".a:filename | echohl None
            return 1
        else
            return 0
        endif
    endif
    return 0
endfunction
" cscope 绑定
if has("cscope")
    set csto=1
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
    nmap <leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>fe :cs find e <C-R>=expand("<cword>")<CR>
    nmap <leader>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <leader>fi :cs find i <C-R>=expand("<cfile>")<CR><CR>
    nmap <leader>fz :cs find i <C-R>=expand("%:t")<CR><CR>
    nmap <leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR>
    " split horizontally, with search result displayed in
    " the new window.
    nmap <leader>fhs :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>fhg :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>fhc :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>fht :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>fhe :scs find e <C-R>=expand("<cword>")<CR>
    nmap <leader>fhf :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <leader>fhi :scs find i <C-R>=expand("<cfile>")<CR><CR>
    nmap <leader>fhz :scs find i <C-R>=expand("%:t")<CR><CR>
    nmap <leader>fhd :scs find d <C-R>=expand("<cword>")<CR><CR>
    " split instead of a horizontal one
    nmap <leader>fvs :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>fvg :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>fvc :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>fvt :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>fve :vert scs find e <C-R>=expand("<cword>")<CR>
    nmap <leader>fvi :vert scs find i <C-R>=expand("<cfile>")<CR><CR>
    nmap <leader>fvz :vert scs find i <C-R>=expand("%:t")<CR><CR>
    nmap <leader>fvd :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif
" Quick Fix 设置
map <leader>cw :cw<cr>
map <F3> :cp<cr>
map <F4> :cn<cr>
" lookup file
" http://www.vim.org/scripts/script.php?script_id=1581
" 增加一行（line 295）: let pattern = '\c' . a:pattern
" 按F5或者;ff打开文件搜索窗口
let g:LookupFile_MinPatLength = 0
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 0
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
if filereadable("./filenametags")
  let g:LookupFile_TagExpr = '"./filenametags"'
endif
nmap <silent> \ff :LookupFile<cr>
function! LookupFile_IgnoreCaseFunc(pattern)
    let _tags = &tags
    try
        let &tags = eval(g:LookupFile_TagExpr)
        let newpattern = '\c' . a:pattern
        let tags = taglist(newpattern)
    catch
        echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
        return ""
    finally
        let &tags = _tags
    endtry
    " Show the matches for what is typed so far.
    let files = map(tags, 'v:val["filename"]')
    return files
endfunction
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'
" Buffers Explorer （需要genutils.vim）
" http://vim.sourceforge.net/scripts/script.php?script_id=42
" http://www.vim.org/scripts/script.php?script_id=197
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = s:PlugWinSize  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber
nmap <silent> <leader>bb :BufExplorer<CR>
"--------------- For ctags --------------------
nmap <leader>; :tag <C-R>=expand("<cword>")<CR><CR>
nmap <leader>[ :tp<CR>
nmap <leader>] :tn<CR>
nmap <silent> <leader>f :let @f=expand("%")<CR>
"--------------- multi language ---------------
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set encoding=utf-8

highlight PMenu ctermfg=40 ctermbg=0
highlight PMenuSel ctermfg=0 ctermbg=4
