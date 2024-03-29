"************************************************************************************
"+ Author:chenb
"+ Email:lcy1059469861@163.com
"+ 该配置使用用插件管理工具vundle
"+ 插件 nerdtree, taglist
"************************************************************************************



"=====================================================
"vim插件配置文件
"
"Install vundle
"1. mkdir -p ~/.vim/bundle
"2. git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"3. open vim and type command    :PluginInstall 
"=====================================================

set nocompatible              " 去除VI一致性,必须要添加
filetype on         "开启文件侦测

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.

"1. Github上的插件,格式为 Plugin '用户名/插件仓库名',例如 Plugin 'tpope/vim-fugitive'
"2. 来自http://vim-scripts.org/vim/scripts.html 的插件, Plugin '插件名称'
"实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略,例如 Plugin 'L9'
"3. 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'，例如 Plugin 'git://git.wincent.com/command-t.git'
"4. 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'，例如 Plugin 'file:///home/gmarik/path/to/plugin'

Plugin 'preservim/nerdtree'
Plugin 'taglist.vim'

call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 常用的命令
" :PluginList       - 列出所有已配置的插件
" :PluginInstall  	 - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :help vundle

"例如打开nerdtree要使用命令':NERDTree',将打开与关闭nerdtree命令与F1键进行绑定
map <F1> :NERDTreeMirror<CR>
map <F1> :NERDTreeToggle<CR>
let g:NERDTreeSize=30
let NERDTreeShowBookmarks=1

"taglist与F2键绑定
map <F2> :TlistToggle<CR>
let Tlist_Show_One_File=1    "只显示当前文件的tags
let Tlist_WinWidth=30        "设置taglist宽度
let Tlist_Exit_OnlyWindow=1  "tagList窗口是最后一个窗口，则退出Vim
let Tlist_Use_Right_Window=1 "在Vim窗口右侧显示taglist窗口

"=====================================================
"vim配色方案
"提示:1.vim自带的colorscheme路经 /usr/share/vim/vim73/colors
"=====================================================

colorscheme morning

"=====================================================
"vim默认vimrc配置文件
"=====================================================

"设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn

"设置vim的窗口大小
"set lines=40 columns=150

" 我的状态行显示的内容（包括文件类型和解码）
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]

" 不显示状态行
set laststatus=0

" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2

"语法高亮
syntax on

"显示相对行号
set relativenumber "等同于 set number"

"查询高亮" hlsearch
"set hls

"查询自动补全" incsearch
set is

"关掉讨厌的提示音"
set noeb

"突出显示当前行
"set cursorline "等同于 set cul

"突出显示当前列
"set cursorcolumn "等同于 set cuc

"共享剪贴板
set clipboard+=unnamed

" 在被分割的窗口间显示空白，便于阅读
"set fillchars=vert:\ ,stl:\ ,stlnc:\

"高亮显示括号匹配
set showmatch

"在处理未保存或只读文件的时候，弹出确认
set confirm

"设置Tab长度为4空格
set tabstop=4
set expandtab

"设置自动缩进长度为4空格
set softtabstop=4
set shiftwidth=4

"不要用空格代替制表符
set noexpandtab

"不产生交换文件，linux当多个用户使用同一个文件，或者修改但是没有正确关闭文件会自动产生swp文件，关闭这个自动产生swp功能
set noswapfile
set nobackup

" 不要使用vi的键盘模式，而是vim自己的
set nocompatible

" 在当前目录和其子目录下递归查找 tags文件 
set tags=tags;
set autochdir

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

" 设置自动补全的选项. longest表示只自动补全最大匹配的部分,剩余部分通过
" CTRL-P/CTRL-N来选择匹配项进行补全. menu表示弹出可补全的内容列表.
" 如果有多个匹配,longest选项不会自动选中并完整补全,要多按一次CTRL-P,比较
" 麻烦,不做设置,保持默认设置,vim默认没有设置longest.
set completeopt=longest,menu "启用这句才会开启自动补全

"C，C++,java,latex 按F5编译运行
"latex用pdf阅读器 okular 显示
map <F5> :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %< && ./%<"
	exec "!rm %<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %< && ./%<"
	exec "!rm %<"
    elseif &filetype == 'python'
	exec "!python %"
    elseif &filetype == 'tex'
	exec "!xelatex % && rm %<.aux %<.log && okular %<.pdf"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc

"新建.c,.cpp,.h,.sh,.java,.py文件，自动插入title
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle()

	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1, "##########################################################################") 
		call append(line("."),   "	#  File Name: ".expand("%")) 
		call append(line(".")+1, "	#  Author: chenb") 
		call append(line(".")+2, "	#  mail: lcy1059469861@163.com") 
		call append(line(".")+3, "	#  Created Time: ".strftime("%c")) 
		call append(line(".")+4, "#########################################################################") 
		call append(line(".")+5, "	#!/bin/zsh")
		call append(line(".")+6, "")
	elseif &filetype == 'python' 
		call setline(1, "##########################################################################") 
		call append(line("."),   "#	+  File Name: ".expand("%")) 
		call append(line(".")+1, "#	+  Author: chenb") 
		call append(line(".")+2, "#	+  mail: lcy1059469861@163.com") 
		call append(line(".")+3, "#	+  Created Time: ".strftime("%c")) 
		call append(line(".")+4, " #########################################################################") 
		call append(line(".")+5, "")
		call append(line(".")+6, "")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."),   "	+  File Name: ".expand("%")) 
		call append(line(".")+1, "	+  Author: chenb") 
		call append(line(".")+2, "	+  mail: lcy1059469861@163.com") 
		call append(line(".")+3, "	+  Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
		call append(line(".")+6, "")
	endif
	".c文件 &filetype = c
	if &filetype == 'c'
		call append(line(".")+7, "#include<stdio.h>")
		call append(line(".")+8, "")
		call append(line(".")+9, "")
	endif
	".cpp文件 &filetype = cpp
	if &filetype == 'cpp'
		call append(line(".")+7, "#include<iostream>")
		call append(line(".")+8, "")
		call append(line(".")+9, "")
	endif
	".java文件 &filetype = java
	if &filetype == 'java'
		call append(line(".")+7,"public class ".expand("%:t:r"))
	endif
	".py文件 &filetype = python
	if &filetype == 'python'
		call append(line(".")+7, "if __name__ == '__main__':")
	endif

endfunc

"自动定位文件末尾
autocmd BufNewFile * normal GA
"vim设置立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC



"=====================================================
"vim快捷键设置，通过map实现
"
"map:用于绑定快捷键，默认作用模式（普通、可视、操作符），默认递归recrusion
"map有nmap,vmap,imap,cmap（普通、可视、插入、命令行）
"noremap: no resrusion
"noremap有nnoremap,vnoremap,inoremap,cnoremap
"unmap后面跟着一个按键组合，表示删除这个映射
"unmap有nunmap,vunmap,iunmap,cunmap
"<CR> = 回车
"
"=====================================================


"新建或者读取已经存在的.c,.cpp,.java,.py文件，配置一些快捷键
autocmd BufNewFile,BufRead *.cpp,*.[ch],*.java,*.py exec ":call SetAdd()" 
"定义函数SetAdd,用于绑定快捷键
func SetAdd() 

	if &filetype == 'c'
		"注释快捷键
		nnoremap <F8> :s#^#//#g<CR>
		nnoremap <F9> :s#//##g<CR>
		vnoremap <F8> :s#^#//#g<CR>
		vnoremap <F9> :s#//##g<CR>
		"设置该语言下常用的函数快捷键
		"inoremap pri printf("");<ESC>hhi
		"inoremap uns unsigned
	endif
	if &filetype == 'java'
		"注释快捷键
		nnoremap <F8> :s#^#//#g<CR>
		nnoremap <F9> :s#//##g<CR>
		vnoremap <F8> :s#^#//#g<CR>
		vnoremap <F9> :s#//##g<CR>

		"设置该语言下常用的函数快捷键
		imap psvm public static void main(String args[]){ <CR>
		inoremap sout System.out.println("");<ESC>hhi

	endif
	if &filetype == 'python'
		"注释快捷键
		nnoremap <F8> :s/^/#/g<CR>
		nnoremap <F9> :s/#//g<CR>
		vnoremap <F8> :s/^/#/g<CR>
		vnoremap <F9> :s/#//g<CR>

		"设置该语言下常用的函数快捷键
		"inoremap pri print("");<ESC>hhi

	endif

endfunc

