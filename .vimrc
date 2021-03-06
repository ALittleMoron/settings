set nocompatible              " be iMproved, required
filetype off                  " required



"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


"----------------------------=== Plugin manager ===--------------------------
Plugin 'gmarik/Vundle.vim'		" let Vundle manage Vundle, required


"----------------------------=== Code/project navigation ===-----------------
Plugin 'scrooloose/nerdtree' 	    	" Project and file navigation


"----------------------------=== Other ===-----------------------------------
Plugin 'bling/vim-airline'   	    	" Lean & mean status/tabline for vim
Plugin 'fisadev/FixedTaskList.vim'  	" Pending tasks list
Plugin 'rosenfeld/conque-term'      	" Consoles as buffers
Plugin 'tpope/vim-surround'	   	" Parentheses, brackets, quotes, XML tags, and more
Plugin 'flazz/vim-colorschemes'         " color themes for vim
Plugin 'xolox/vim-misc'                 " required plugin for vim-colorscheme-switcher
Plugin 'xolox/vim-colorscheme-switcher' " easy switch your color scheme on vim
Plugin 'tpope/vim-fugitive'             " git integration 


"----------------------------=== Snippets support ===------------------------
Plugin 'garbas/vim-snipmate'		" Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
Plugin 'tomtom/tlib_vim'		" dependencies #2
Plugin 'honza/vim-snippets'		" snippets repo


"----------------------------=== Languages support ===-----------------------
" --- Python ---
Plugin 'davidhalter/jedi-vim' 		" Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'		" Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
Plugin 'vim-syntastic/syntastic'        " syntax highlighting
Plugin 'nvie/vim-flake8'                " PEP8 checking in python


call vundle#end()            		" required
filetype on
filetype plugin on
filetype plugin indent on


"=====================================================
" General settings
"=====================================================
set backspace=indent,eol,start
aunmenu Help.
aunmenu Window.
let no_buffers_menu=1
set mousemodel=popup
set linebreak
set clipboard=unnamed


set ruler
set completeopt-=preview
set gcr=a:blinkon0
set ttyfast


" включить подсветку кода
syntax on
let g:python_highlight_all=1

" базовый визуал
set t_Co=256
set guifont=Monaco:h18
colorscheme OceanicNext


tab sball
set switchbuf=useopen


" отключаем пищалку и мигание
set visualbell t_vb= 
set novisualbell       


set enc=utf-8	     " utf-8 по дефолту в файлах
set ls=2             " всегда показываем статусбар
set incsearch	     " инкреминтируемый поиск
set hlsearch	     " подсветка результатов поиска
set nu	             " показывать номера строк
set scrolloff=5	     " 5 строк при скролле за раз


" отключаем бэкапы и своп-файлы
set nobackup 	     " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile 	     " no swap files



" прячем панельки
" set guioptions-=m   " меню
set guioptions-=T    " тулбар
" set guioptions-=r   "  скроллбары


" настройка на Tab
set smarttab
set tabstop=8


"  при переходе за границу в 80 символов в Ruby/Python/js/C/C++ подсвечиваем на темном фоне текст
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END


" указываем каталог с настройками SnipMate
let g:snippets_dir = "~/.vim/vim-snippets/snippets"


" настройки Vim-Airline
set laststatus=2
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'



" NerdTree настройки

"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']  



" syntastic настройки
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = 'python3'


" SnipMate
let g:snipMate = { 'snippet_version' : 1} 

" User hotkeys
"=====================================================

" TaskList настройки
map <F2> :TaskList<CR> 	   " отобразить список тасков на F2


" показать NERDTree на F3
map <F3> :NERDTreeToggle<CR>


" Работа буфферами
map <C-q> :bd<CR> 	   " CTRL+Q - закрыть текущий буффер


" пока что ничего нет на F4


" а debug-mode на <F5>
nnoremap <F5> :exe "ConqueTermSplit ipython3 " . expand("%")<CR>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0


" запуск интерпретатора на F6
nnoremap <F6> :ConqueTermSplit ipython3<CR>


" на F7 забит flake8
" на F8 забито переключение тем vim


" пока что ничего нет на F9


" автокомплит через <Ctrl+Space>
inoremap <C-space> <C-x><C-o>


" Документация по функции через <K> (Jedi)


"=====================================================
" Languages support
"=====================================================
" --- Python ---
"autocmd FileType python set completeopt-=preview " раскомментируйте, в случае, если не надо, чтобы jedi-vim показывал документацию по методу/классу
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with



" --- JavaScript ---
let javascript_enable_domhtmlcss=1
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.json setlocal ft=javascript


" --- HTML ---
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags


" --- template language support (SGML / XML too) ---
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd bufnewfile,bufread *.rhtml setlocal ft=eruby
autocmd BufNewFile,BufRead *.mako setlocal ft=mako
autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python
let html_no_rendering=1
let g:closetag_default_xml=1
let g:sparkupNextMapping='<c-l>'
autocmd FileType html,htmldjango,htmljinja,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako source ~/.vim/scripts/closetag.vim


" --- CSS ---
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
