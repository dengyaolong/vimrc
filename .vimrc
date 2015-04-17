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
set cul "高亮行
set cuc "高亮列

"--文件编码
set enc=utf-8 "设置默认编码utf-8
set termencoding=utf-8 "终端编码
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,gb18030 "文件编码
set helplang=cn  "帮助文档语言为中文

"--缩进
set ts=4 "一个tab 4个空格
set sw=4 "自动缩进时 4个空格
set et   "将tab置为空格
set smarttab "一个backspace删除tab生成的4个空格
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
set foldmethod=syntax "自动语法折叠
autocmd FileType python setlocal foldmethod=indent "设置python按缩进折叠

"--括号匹配
set sm "高亮匹配的括号
set matchtime=1 "单位十分之一秒
 
"--命令行设置
set showcmd    " 命令行显示输入的命令
set showmode   " 命令行显示vim当前模式
set report=0   "告诉我们哪一行被改过
set laststatus=2
""let g:airline#extensions#hunks#enabled=1 
""let g:airline#extensions#tabline#left_sep = ' '
""let g:airline#extensions#tabline#left_alt_sep = '|'
""function! AirlineInit()
""    let g:airline_section_a = airline#section#create(['mode','branch'])
""    let g:airline_section_b = airline#section#create_left(['ffenc','hunks'])
""    let g:airline_section_x = airline#section#create(['filetype'])
""    let g:airline_section_y = airline#section#create(['%P'])
""    let g:airline_section_z = airline#section#create_right(['%l','%c'])
""endfunction
""autocmd VimEnter * call AirlineInit()

"--主题
syntax enable "打开语法高亮
syntax on "语法高亮
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

"--补全
call pathogen#infect() " 启用bundle
filetype plugin indent on "补全前提
""let g:ycm_key_list_select_completion=['<c-n>']
""let g:ycm_key_list_select_completion = ['<Down>']
""let g:ycm_key_list_previous_completion=['<c-p>']
""let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_collect_identifiers_from_tags_files=1 
let g:ycm_confirm_extra_conf = 0              " 不用每次提示加载.ycm_extra_conf.py文件
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0              " 关闭ycm的syntastic
"let g:ycm_filetype_whitelist = {'c' : 1, 'cpp' : 1, 'java' : 1, 'python' : 1}
let g:ycm_complete_in_comments = 1                " 评论中也应用补全
let g:ycm_min_num_of_chars_for_completion = 2     " 两个字开始补全
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_semantic_triggers =  {'c' : ['->', '.'], 'objc' : ['->', '.'], 'ocaml' : ['.', '#'], 'cpp,objcpp' : ['->', '.', '::'], 'php' : ['->', '::'], 'cs,java,javascript,vim,coffee,python,scala,go' : ['.'], 'ruby' : ['.', '::']}
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'gitcommit' : 1,
      \}
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
set wildmenu   "命令模式用 Tab 补全单行菜单形式显示
set completeopt=longest,menu "只在补全下拉菜单中显示
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {<CR>}<ESC>O
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
function! ClosePair(char)
if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

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
imap <C-k> <ESC>d$i
map <C-d> x
imap <C-d> <Del>

"--tabe中移动
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>
