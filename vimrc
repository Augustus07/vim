"===================
"适合自己用的vimrc配置文件
"===================

"设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn

" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]

" 总是显示状态行
set laststatus=2

" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=1

"保存.vimrc文件时自动重启加载，即让此文件立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"语法高亮
syntax on

"显示行号
set nu "等同于 set number"

"查询高亮" hlsearch
set hls

"查询自动补全" incsearch
set is

"突出显示当前行
"set cursorline "等同于 set cul

"突出显示当前列
"set cursorcolumn "等同于 set cuc

"共享剪贴板
set clipboard+=unnamed

"高亮显示括号匹配
set showmatch

"在处理未保存或只读文件的时候，弹出确认
set confirm


"设置Tab长度为4空格
set tabstop=4
"设置自动缩进长度为4空格
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab

"=============显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif

"=============新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\############################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: chenb")
        call append(line(".")+2, "\# mail: lcy1059469861@qq.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\############################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    else
        call setline(1, "/******************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: chenb")
        call append(line(".")+2, "    > Mail: lcy1059469861@qq.com ")
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))
        call append(line(".")+4, " *****************************/")
        call append(line(".")+5, "")
    endif

    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc

"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction 
"打开文件类型检测,并载入文件类型插件,为特定文件类型载入相关缩进文
filetype plugin indent on
" 设置自动补全的选项. longest表示只自动补全最大匹配的部分,剩余部分通过
" CTRL-P/CTRL-N来选择匹配项进行补全. menu表示弹出可补全的内容列表.
" 如果有多个匹配,longest选项不会自动选中并完整补全,要多按一次CTRL-P,比较
" 麻烦,不做设置,保持默认设置,vim默认没有设置longest.
set completeopt=longest,menu "启用这句才会开启自动补全

" 侦测文件类型
filetype on

"设置字体
set guifont=Courier_New:h10:cANSI
"设置颜色主题,适用于黑色背景.
colorscheme industry 
