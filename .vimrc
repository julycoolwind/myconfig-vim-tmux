set nocompatible
set backspace=indent,eol,start
set autochdir
" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

let mapleader=","

set encoding=utf-8
set nu
set nowrap
set showmatch
set ma

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set shiftround
set autoindent

set foldmethod=indent
set foldlevel=99

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
"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-l> <c-w>l
"map <c-h> <c-w>h

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
"color wombat256mod
colorscheme solarized

" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

au BufNewFile,BufRead *.tsx set filetype=javascript.jsx
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"set Vundle inital runtime path
call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdcommenter'
let NERDSpaceDelims=1           " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1       " 多行注释时样子更好看
let g:NERDDefaultAlign = 'left'  "将行注释符左对齐

Plug 'vim-scripts/indentpython.vim'

Plug 'Valloric/YouCompleteMe',{'do':'./install.py --tern-completer'}

Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'scrooloose/nerdtree'

Plug 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git'

Plug 'jnurmine/Zenburn'

Plug 'godlygeek/tabular'

Plug 'terryma/vim-multiple-cursors'

Plug 'tpope/vim-surround'

Plug 'altercation/vim-colors-solarized'

Plug 'mattn/emmet-vim'
" For git
Plug 'tpope/vim-fugitive'

Plug 'bling/vim-airline'

Plug 'jiangmiao/auto-pairs'

Plug 'tell-k/vim-autopep8'

Plug 'tpope/vim-endwise'

Plug 'christoomey/vim-run-interactive'

Plug 'jmcomets/vim-pony'
"安装tagbar插件  
Plug 'majutsushi/tagbar'  
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


Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required=0
Plug 'Valloric/MatchTagAlways'
let g:mta_filetypes = {'javascript.jsx':1}
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
call plug#end()

" Settings for vim-powerline
set laststatus=2

nnoremap <silent> <F5> :NERDTree<CR>

let python_highlight_all=1

let g:ycm_python_binary_path = 'python'
" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" make YCM compatible with UltiSnips (using supertab)
 let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
 let g:ycm_key_list_previous_completion = ['<C-m>', '<Up>']
 let g:SuperTabDefaultCompletionType = '<tab>'
nnoremap <leader>gic    :YcmCompleter GoToInclude<CR>
nnoremap <leader>gdc    :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gdf    :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gip    :YcmCompleter GoToImprecise<CR>
  
  " better key bindings for UltiSnipsExpandTrigger
  let g:UltiSnipsExpandTrigger="<c-e>"
  let g:UltiSnipsJumpForwardTrigger="<c-j>"
  let g:UltiSnipsJumpBackwardTrigger="<c-k>"
  let g:UltiSnipsSnippetDirectories=["UltiSnips","mysnippets"]
" vim-snippets Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<C-e>"
"let g:UltiSnipsJumpForwardTrigger="<C-j>"
"let g:UltiSnipsJumpBackwardTrigger="<C-h>"
"let g:UltiSnipsSnippetDirectories=["UltiSnips","mysnippets"]


"PEP8 space and tab for Python
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
"\ set textwidth=79 |
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
