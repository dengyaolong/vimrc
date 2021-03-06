"--------------配置------------
"--基本设置
set nocp "关闭vi兼容
set shortmess=atI  "不帮助乌干达儿童了
set noeb "关闭出错的提示声音
set ambiwidth=double "避免“——”非常短，“★”显示不出来
set scrolloff=6 "保持到底部6行差距"
set magic "除了$ . * ^之外都要反斜杠转义

"--行列设置
set nu   "显示行号
set ru   "右下角显示行列
set pastetoggle=<F2> "按F2切换显示行号
" set cul "高亮行
" set cuc "高亮列

"--文件编码
set enc=utf-8 "设置默认编码utf-8
set termencoding=utf-8 "终端编码
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,gb18030 "文件编码
set helplang=cn  "帮助文档语言为中文

"--缩进
set ts=2 "一个tab 2个空格
set sw=2 "自动缩进时 2个空格
set et   "将tab置为空格
set smarttab "一个backspace删除tab生成的2个空格
set autoindent   "自动缩进

"--处理临时文件
set confirm "未保存时候给予确认
set nobackup "不生成临文件
set noswapfile "不生成swap文件

"--backspace设置
set backspace=2 " 使回格键（backspace）正常处理indent, eol, start等
set whichwrap+=<,>,h,l  " 允许backspace和光标键跨越行边界

"--搜索相关
set is "实时搜索(没按回车就开始搜)
set hls "搜索结果语法高亮，:noh关闭高亮

"--断行设置
set tw=78 "78列就转行的强迫症 
set lbr   "不允许单词这段
set fo+=mB "m允许汉字断行，B将两行合并一行汉字不要加空格

"--折叠
set foldenable "开启折叠
set foldmethod=manual "syntax "自动语法折叠
autocmd FileType python setlocal foldmethod=indent "设置python按缩进折叠

"--括号匹配
set sm "高亮匹配的括号
set matchtime=1 "单位十分之一秒
 
"--命令行设置
set showcmd    " 命令行显示输入的命令
set showmode   " 命令行显示vim当前模式
set report=0   "告诉我们哪一行被改过
set laststatus=2

"--主题
syntax enable "打开语法高亮
syntax on "语法高亮
set background=dark
"colorscheme solarized
let g:solarized_termcolors=256

"--补全
call pathogen#infect() " 启用bundle
filetype plugin indent on "补全前提
set wildmenu   "命令模式用 Tab 补全单行菜单形式显示
set completeopt=longest,menu "只在补全下拉菜单中显示

"--鼠标(建议不要用)
" set mouse=nv "在n(ormal),v(isual),i(nsert),h(elp)模式下使用鼠标。

"NEARDTree"
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc']

"git gutter"
nmap <F6> :GitGutterSignsToggle<CR>
let g:gitgutter_signs = 0
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

"------------node配置"
set runtimepath^=~/.vim/bundle/node 
"------------F5执行
map <F5> :call CompileRunGcc()<CR>
"autocmd FileType tex map <F6> :!pdflatex %<CR>
"autocmd FileType tex map <F5> :!evince %<.pdf<CR>
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
    exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    elseif &filetype == 'tex' 
        exec "!evince %<.pdf "
    elseif &filetype == 'plaintex'
        exec "!evince %<.pdf "
    elseif &filetype == 'javascript'
        exec "!node %"
  endif
endfunc

"----------dyl的特殊emacs键位爱好
"--移动
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-n> <Down>
imap <C-p> <Up>
map <C-f> l
map <C-b> h
map <C-n> j
map <C-p> k
imap <C-e> <END>
imap <C-a> <HOME>
map <C-a> ^
map <C-e> $

"--删除
map <C-k> d$
imap <C-k> <ESC>ld$a
map <C-d> x
imap <C-d> <Del>

"--tabe中移动
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>

"--  C-i 代替Esc
imap <C-i> <ESC>
