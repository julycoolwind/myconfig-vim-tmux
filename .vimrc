set nocompatible
set backspace=indent,eol,start
set autochdir
" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

set encoding=utf-8
set nu

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftwidth=4
set shiftround
set autoindent

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap
 
" bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
" " Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving of code blocks
" " Try to go into visual mode (v), thenselect several lines of code here and
" " then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" " MUST be inserted BEFORE the colorscheme command
" "" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" "" au InsertLeave * match ExtraWhitespace /\s\+$/
"
"
" " Color scheme
" " mkdir -p ~/.vim/colors && cd ~/.vim/colors
" " wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

"set Vundle inital runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Set Vundle to manage Plugin version
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-scripts/indentpython.vim'

Bundle 'Valloric/YouCompleteMe'

Plugin 'scrooloose/syntastic'

Plugin 'SirVer/ultisnips'

Plugin 'honza/vim-snippets'

Plugin 'scrooloose/nerdtree'

Plugin 'kien/ctrlp.vim'

Plugin 'jnurmine/Zenburn'

Plugin 'godlygeek/tabular'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'tpope/vim-surround'

Plugin 'altercation/vim-colors-solarized'

Plugin 'mattn/emmet-vim'
" For git
Plugin 'tpope/vim-fugitive'

Bundle 'bling/vim-airline'

Bundle 'jiangmiao/auto-pairs'

Bundle 'tpope/vim-endwise'
Bundle 'christoomey/vim-run-interactive'
"安装tagbar插件  
Bundle 'majutsushi/tagbar'  
""设置tagbar使用的ctags的插件,必须要设置对  
let g:tagbar_ctags_bin='/usr/local/Cellar/ctags/5.8_1/bin/ctags'  
"设置tagbar的窗口宽度  
let g:tagbar_width=30  
""设置tagbar的窗口显示的位置,为左边  
let g:tagbar_right=1  
"打开文件自动 打开tagbar  
autocmd BufReadPost *.py,*.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.rb call tagbar#autoopen()  
""映射tagbar的快捷键  
map <F8> :TagbarToggle<CR>  

call vundle#end()

" Settings for vim-powerline
set laststatus=2

nnoremap <silent> <F5> :NERDTree<CR>

if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme Zenburn
endif
let python_highlight_all=1

" vim-snippets Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"PEP8 space and tab for Python
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix

map <f2> :NERDTreeToggle<cr>
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
""窗口位置
let g:NERDTreeWinPos='left'
""窗口尺寸
let g:NERDTreeSize=30
""窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
""不显示隐藏文件
let g:NERDTreeHidden=0
""打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
