"显示行尾的空格
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

set foldmethod=marker
set expandtab
"let g:winManagerWindowLayout='TagList|FileExplorer'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let g:Tlist_Use_Right_Window=1
syntax enable
syntax on
filetype plugin indent on
set completeopt=longest,menu
set shiftwidth=4
set mouse=i
set nu
set tabstop=4               " 设定 tab 长度为 4
"smartcase，这样搜索时默认不区分大小写，只有搜索关键字中出现一个大字母时才区分大小写
set ignorecase smartcase
set autowrite

" 删除所有行未尾空格
nmap <F12> :%s/[ \t\r]\+$//g<CR>
"把tab 替换为空格
nmap <F9> :%s/\t/    /g<CR>

"光标在窗口上下边界时距离边界7行即开始滚屏
set so=7

"setlocal omnifunc=javacomplete#Complete

if has("autocmd")
"autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype java set omnifunc=javacomplete#Complete
"Set 'completefunc' option to show parameters information IF YOU LIKE. e.g. 
"setlocal completefunc=javacomplete#CompleteParamsInfo  
endif

inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P> 
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>


let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

nmap <C-1> :only<CR>
nmap <F2> :close<CR>
nmap <F4> :WMToggle<CR>
nmap <F5> :Tlist<CR>
let g:miniBufExplMapCTabSwitchBufs = 1
nnoremap <silent> <F3> :Grep<CR>

nmap ,v "+p
vmap ,c "+yy
nmap ,c "+yy


"Move one line up and down
map <A-UP> yyddkkp
map <A-DOWN> yyddp
nmap <A-UP> yyddkkp
nmap <A-DOWN> yyddp
imap <A-UP> <ESC>yyddkkpi
imap <A-DOWN> <ESC>yyddpi

"Copy one line up/down to the original line
map <C-UP> yykp
map <C-DOWN> yyp
nmap <C-UP> yykp
nmap <C-DOWN> yyp
imap <C-UP> <ESC>yykpi
imap <C-DOWN> <ESC>yypi

"Delete current line
nmap <C-D> dd
imap <C-D> <ESC>ddi
map <C-D> dd

"Exit 
nmap <C-E> :qa<CR>
imap <C-E> :qa<CR>
map <C-E> :qa<CR>

"Save Exit 
nmap <C-W> :wqa<CR>
imap <C-W> :wqa<CR>
map <C-W> :wqa<CR>

"括号补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i

function ClosePair(char)
if getline('.')[col('.') - 1] == a:char
return "\<Right>"
else
return a:char
endif
endf



" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
set csprg=/usr/bin/cscope
set csto=1
set cst
set nocsverb
" add any database in current directory
if filereadable("cscope.out")
  "cs add cscope.out
endif
set csverb
endif

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR> 

