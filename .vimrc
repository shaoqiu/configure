"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""base setting""""""""""""""""""""""""""""""
hi Pmenu ctermbg=gray "设置补全菜单的背景色
hi PmenuSel ctermbg=blue 
set nocompatible "关闭VI 兼容模式
set autowrite "切换编辑的文件时，自动保存当前正在编辑的文件
set number	"显示行号
set ruler	"打开状态栏标尺
set shiftwidth=4 "设定>> 命令移动时的宽度
set softtabstop=4 "这将会让一个制表符只插入4个字符宽度的缩进
set tabstop=4	"设定TAB 长度为4
set nobackup	"覆盖文件时不备份
set showcmd    "将输入的命令显示出来，便于查看当前输入的信息
set ignorecase smartcase "搜索时忽略大小写
set mps+=<:> "设置高亮匹配的括号
set incsearch "增量搜索
set mouse=a "启用鼠标
set smartindent "智能缩进
set backspace=indent,eol,start "按backspace 时的
set cmdheight=1 "显示命令行的区域的高度
set scrolloff=3 "光标距顶部或底部为N行时，开始滚屏
set laststatus=2 "状态栏的高度
set completeopt+=menu
set completeopt+=longest
set completeopt-=preview  " 补全内容不以分割子窗口形式出现，只显示补全列表
set switchbuf+=usetab,newtab "通过quickfix窗口打开文件时,在新的TAB中打开
set t_ti= t_te= "退出VIM后，内容显示在终端屏幕，可以用于查看
set relativenumber "使用相对行号

" 插入模式/失去焦点时用绝对行号, 普通模式获取焦点时用相对行号
augroup SetNumber
	autocmd!
	autocmd FocusLost * :set norelativenumber number
	autocmd FocusGained * :set relativenumber
	autocmd InsertEnter * :set norelativenumber number
	autocmd InsertLeave * :set relativenumber
augroup END

set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 

"开启打印信息，打印信息会保存到/tmp/vim-debug
let g:vim_debug_enable = 1

".vimrc 文件有更改时，重新加载生效
augroup reload_vimrc 
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END 

" 配置多语言环境
if has("multi_byte")
	" UTF-8 编码
	set encoding=utf-8
	set termencoding=utf-8
	set formatoptions+=mM
	set fencs=utf-8,gbk

	if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
		set ambiwidth=double
	endif
else
	echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

filetype plugin on "自动检测文件类型
filetype plugin indent on "自动根据文件类型进行缩进
syntax enable "自动语法高亮
"highlight LineNr ctermfg=0 "设置行号的颜色
"""""""""""""""""""""""base setting""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""shortcut setting""""""""""""""""""""""""""""""
let mapleader=";" "设置前导键为 ;

inoremap ;; <esc>

"插入一个空行
nnoremap <leader><cr> o<Esc>

"保存与退出
nnoremap <leader>wa :wa<cr>
nnoremap <leader>qa :qa<cr>
nnoremap <leader>sh :sh<cr>

"edit vimrc
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

":help 当前光标的单词
"注：<C-R><C-W> 可以将当前光标所在单词输入到cmdline中
nnoremap <leader>he :h <C-R><C-W><cr>

"按方向键切换窗口
nnoremap <Left> <C-W>h
nnoremap <Right> <C-W>l
nnoremap <Up> <C-W>k
nnoremap <Down> <C-W>j

"切换标签页
nnoremap <C-H> gT
nnoremap <C-L> gt

"新建一个标签页
nnoremap te :tabedit 

"quickfix 窗口开关
nnoremap tq :call QuickfixToggle()<cr>

"给光标下的单词加上引号
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>wwl
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>wwl

"goto end of line and start of line
nnoremap <leader>hh 1000h
nnoremap <leader>ll 1000l

"""""""""""""""""""""""shortcut setting""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""plugin setting""""""""""""""""""""""""""""""
"Ag settings
let g:agprg="ag --column --smart-case"
nnoremap <leader>ag :Ag! <C-R><C-W><cr>


" toggle comments
nnoremap cm :call NERDComment(0, "toggle")<cr>

"tagbar setting 变量，函数列表
"tagbar 在左边显示，默认是在右边的。
let tagbar_left               =1
let tagbar_width              =30
let g:tagbar_show_linenumbers = 1
nnoremap tt :TagbarToggle<cr><C-W>h

"gtags 搜索时不打开quickfix 窗口
let g:Gtags_OpenQuickfixWindow = 0

"ctrlp setting 文件查找
"可以使用两种方式来打开ctrlp
"一种是在VIM的工作目录下查找, ",,"
"在一个工程目录比较大的时候,使用这种方式进行查找比较快速
"另一种是使用ctrlp的默认方式打开, "ctrl + p"
"在工程比较小时,使用这种方式进行查找快速简单
nmap ,, :CtrlP getcwd()<cr>
set wildignore+=*/tmp/*,*/lib/*,*/libs/*,*.so,*.class,*.swp,*.zip,*.png,*.jpg,*.gif,*.apk,*.dex,*.ap_,*/HTML/*,HTML/*,*.bin,*/bin/*,*.o,*.JPG
"open file in new table instead of buffer
let g:ctrlp_prompt_mappings = {
			\ 'AcceptSelection("e")': [],
			\ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
			\ }
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/]\.(git|hg|svn)$',
			\ 'file': '\v\.(exe|so|dll)$',
			\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
			\ }
"修改该选项为1，设置默认为按文件名搜索（否则为全路径）:
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'
"扫描文件的最大数量，设置为0时不进行限制:
"最大数量default为10000,怪不得当搜索那些非常大的工程时
"会出现搜索不到的情况
let g:ctrlp_max_files = 0
"ctrlp-tags setting
let g:ctrlp_extensions = ['tags']
nnoremap <Leader>ff :CtrlPTags<cr>
" Initialise list by a word under cursor
nnoremap <Leader>fd :execute 'CtrlPTags ' . expand('<cword>')<cr>

"completeopt
"回车即选中当前项
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"上下左右键的行为 会显示其他信息
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"YouCompleteMe setting
" 补全功能在注释中同样有效  
let g:ycm_complete_in_comments=1  
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示  
let g:ycm_confirm_extra_conf=0  
" 从TAGS 文件中搜集匹配的符号
let g:ycm_collect_identifiers_from_tags_files=1  
" 从第一个键入字符就开始罗列匹配项  
let g:ycm_min_num_of_chars_for_completion=2  
" 禁止缓存匹配项，每次都重新生成匹配项  
let g:ycm_cache_omnifunc=0  
" 语法关键字补全              
let g:ycm_seed_identifiers_with_syntax=1  
"找不到.ycm_extra_conf.py 文件时使用全局的.ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"调用补全功能的快捷键
let g:ycm_key_invoke_completion = '<C-O>'


"markdown setting 
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=1
let g:vim_markdown_no_default_key_mappings=1
"""""""""""""""""""""""plugin setting""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""plugin manager""""""""""""""""""""""""""""""

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"omniCppComplete
Bundle 'OmniCppComplete'

"search pattern in all pwd files 
"nedd pacman -S the_silver_searcher
Bundle 'rking/ag.vim'

"auto pairs alt + p  close the plugin
Bundle  'jiangmiao/auto-pairs.git' 

"NERD_Commenter 注释方法为  ";c<space>"  取消注释也一样
Bundle 'The-NERD-Commenter'

"manager itself
"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
Bundle 'gmarik/vundle'

"tagbar
Bundle 'vim-scripts/Tagbar.git'

"ctrlp
Bundle 'kien/ctrlp.vim.git'
Bundle 'konkashaoqiu/ctrlp-tags.git'

"vim tools
Bundle 'konkashaoqiu/vim-tools.git'

"svn tools 
Bundle 'konkashaoqiu/svnlog.git'
Bundle 'konkashaoqiu/svncommit.git'
Bundle 'konkashaoqiu/genycmconfig.git'

"YouCompleteMe
"安装方法，不要忘了后面的参数! ./install.sh --clang-completer
Bundle 'Valloric/YouCompleteMe'

"markdown 
Bundle 'plasticboy/vim-markdown'

filetype plugin on
filetype plugin indent on

"""""""""""""""""""""""plugin manager""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""my function""""""""""""""""""""""""""""""""""
function! QuickfixToggle()
	if exists("g:qfix_win") 
		cclose
		unlet g:qfix_win
	else
		copen 10
		let g:qfix_win = bufnr("$")
	endif
endfunction

function! AlignAssignments()
    "Patterns needed to locate assignment operators...
    let ASSIGN_OP   = '[-+*/%|&]\?=\@<!=[=~]\@!'
    let ASSIGN_LINE = '^\(.\{-}\)\s*\(' . ASSIGN_OP . '\)'

    "Locate block of code to be considered (same indentation, no blanks)
    let indent_pat = '^' . matchstr(getline('.'), '^\s*') . '\S'
    let firstline  = search('^\%('. indent_pat . '\)\@!','bnW') + 1
    let lastline   = search('^\%('. indent_pat . '\)\@!', 'nW') - 1
    if lastline < 0
        let lastline = line('$')
    endif

    "Find the column at which the operators should be aligned...
    let max_align_col = 0
    let max_op_width  = 0
    for linetext in getline(firstline, lastline)
        "Does this line have an assignment in it?
        let left_width = match(linetext, '\s*' . ASSIGN_OP)

        "If so, track the maximal assignment column and operator width...
        if left_width >= 0
            let max_align_col = max([max_align_col, left_width])
            let op_width      = strlen(matchstr(linetext, ASSIGN_OP))
            let max_op_width  = max([max_op_width, op_width+1])
         endif
    endfor

    "Code needed to reformat lines so as to align operators...
    let FORMATTER = '\=printf("%-*s%*s", max_align_col, submatch(1),
    \                                    max_op_width,  submatch(2))'

    " Reformat lines with operators aligned in the appropriate column...
    for linenum in range(firstline, lastline)
        let oldline = getline(linenum)
        let newline = substitute(oldline, ASSIGN_LINE, FORMATTER, "")
        call setline(linenum, newline)
    endfor
endfunction

nnoremap <silent>  <leader>=  :call AlignAssignments()<CR>
"""""""""""""""""""""""my function""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""cscope setting"""""""""""""""""""""""""""""""
set cscopeprg=gtags-cscope
set cscopetag
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-

au BufWritePost *.[ch] call UpdateGtags(expand('<afile>'))
au BufWritePost *.[ch]pp call UpdateGtags(expand('<afile>'))
au BufWritePost *.[ch]xx call UpdateGtags(expand('<afile>'))
au BufWritePost *.java call UpdateGtags(expand('<afile>'))
au BufWritePost *.cc call UpdateGtags(expand('<afile>'))

function! UpdateGtags(f)
  let dir = fnamemodify(a:f, ':p:h')
  exe 'silent !cd ' . dir . ' && global -u &> /dev/null &'
endfunction

function! LoadCscope()
	let db = findfile("GTAGS", ".;")
	if (!empty(db))
		let path = strpart(db, 0, match(db, "/GTAGS$"))
		set nocsverb " suppress 'duplicate connection' error
		set csto=0
		set cst
		" add any database in current directory
		if filereadable(db)
			exe "cs add " . db . " " . path
			" else add database pointed to by environment
		elseif $CSCOPE_DB != ""
			cs add $CSCOPE_DB
		endif
		set csverb
	endif
endfunction

au BufEnter /* call LoadCscope()

"查找定义
nnoremap <leader>fg :cs find g <C-R><C-W><CR>
"查找引用
nnoremap <leader>fc :cs find c <C-R><C-W><CR>
"查找符号
nnoremap <leader>fs :cs find s <C-R><C-W><CR>
"0或者s   —— 查找这个C符号
"1或者g  —— 查找这个定义
"2或者d  —— 查找被这个函数调用的函数（们）
"3或者c  —— 查找调用这个函数的函数（们）
"4或者t   —— 查找这个字符串
"6或者e  —— 查找这个egrep匹配模式
"7或者f   —— 查找这个文件
"8或者i   —— 查找#include这个文件的文件（们）
""""""""""""""""""cscope setting"""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
