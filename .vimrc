"скин ксория
"color xoria256
colorscheme xoria256

" Размер табуляции
set tabstop=4 softtabstop=4 
" Размер сдвига при нажатии на клавиши << и   >>  
set shiftwidth=4
" Копирует отступ от предыдущей строки
set autoindent
" Включаем 'умную' автоматическую расстановку отступов
set smartindent
" Включаем подсветку синтаксиса
syntax on
" Включаем мышку даже в текстовом режиме
" (очень удобно при копировании из терминала, т. к. без этой опции,
" например, символы табуляции раскладываются в кучу пробелов).
set mouse=a

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
"
Bundle 'git://github.com/mattn/zencoding-vim.git'
Bundle 'git://github.com/scrooloose/nerdcommenter.git'
Bundle 'git://github.com/scrooloose/nerdtree.git'
Bundle 'git://github.com/majutsushi/tagbar.git' 
Bundle 'git://github.com/tomtom/checksyntax_vim.git'
Bundle 'git://github.com/vim-scripts/highlight_current_line.vim.git'
Bundle 'git://github.com/vim-scripts/bufexplorer.zip.git'
Bundle 'git://github.com/tpope/vim-surround.git'

" NERDTree                                                                                                                  
nmap <Bs> :NERDTreeToggle<CR>                                           
let NERDTreeShowBookmarks=1                                             
let NERDTreeChDirMode=2                                                 
let NERDTreeQuitOnOpen=1                                                
let NERDTreeShowHidden=1                                                
let NERDTreeKeepTreeInNewTab=0                                          
let NERDTreeMinimalUI=1 " Disables display of the 'Bookmarks' label and Press ? for help' text.
let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.
let NERDTreeBookmarksFile= $HOME . '/.vim/.NERDTreeBookmarks'

filetype plugin indent on
au BufRead,BufNewFile *.stpl		setfiletype html

" Отключаем создание бэкапов
set nobackup
" Отключаем создание swap файлов
set noswapfile
" Все swap файлы будут помещаться в эту папку
set dir=~/.vim/swap/

" AutoReload .vimrc                                                         
" from http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
" Source the vimrc file after saving it                                 
if has("autocmd")                                                     
	autocmd! bufwritepost .vimrc source $MYVIMRC                                                                        
endif                                                                 

 
" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз
" когда переключаешься между ними
set hidden

" включить нумерацию
set nu

" Опции сесссий
set sessionoptions=curdir,buffers,tabpages

" Минимальная высота окна
set winminheight=0
" Минимальная ширина окна
set winminwidth=0

" Всегда отображать статусную строку для каждого окна
set laststatus=2

" Опции автодополнения - включаем только меню с доступными вариантами
" автодополнения (также, например, для omni completion может быть
" окно предварительного просмотра).
set completeopt=menu


" Включаем перенос строк
set wrap
" Перенос строк по словам, а не по буквам
set linebreak

" Включаем отображение выполняемой в данный момент команды в правом нижнем углу экрана.
" К примеру, если вы наберете 2d, то в правом нижнем углу экрана Vim отобразит строку 2d.
set showcmd
" Включаем отображение дополнительной информации в статусной строке
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P

" Включаем подсветку выражения, которое ищется в тексте
set hlsearch
" При поиске перескакивать на найденный текст в процессе набора строки
set incsearch
" Останавливать поиск при достижении конца файла
set nowrapscan
" Игнорировать регистр букв при поиске
set ignorecase



"" Размер истории для отмены
"set undolevels=1000

" Список кодировок файлов для автоопределения
set fileencodings=utf-8,cp1251,koi8-r,cp866

" Включает виртуальный звонок (моргает, а не бибикает при ошибках)
set visualbell

" Перемещать курсор на следующую строку при нажатии на клавиши вправо-влево и пр.
set whichwrap=b,s,<,>,[,],l,h

" Метод фолдинга - вручную (для обычных файлов)
set foldmethod=manual

" Настраиваем переключение раскладок клавиатуры по <C-^>
set keymap=russian-jcukenwin
" Раскладка по умолчанию - английская
set iminsert=0


" Включаем фолдинг (сворачивание участков кода)
"set foldenable
" Сворачивание по синтаксу
"set fdm=syntax


" Горячие клавиши -->
"запустить Tagbar
nmap <F8> :TagbarToggle<cr>
imap <F8> <esc>:TagbarToggle<cr>i<right>
"let g:tagbar_autoclose = 1


" Ускоренное передвижение по тексту
nmap <C-H> 5h
nmap <C-J> 5j
nmap <C-K> 5k
nmap <C-L> 5l

" Клавиши быстрого редактирования строки в режиме вставки
" и в режиме редактирования командной строки.
" -->
"imap <C-H> <BS>
imap <C-J> <Left>
imap <C-K> <Right>
imap <C-L> <Del>

"cmap <C-H> <BS>
cmap <C-J> <Left>
cmap <C-K> <Right>
cmap <C-L> <Del>
" <--


" Очистить подсветку последнего найденного выражения
nmap <F3> :nohlsearch<CR>
imap <F3> <Esc>:nohlsearch<CR>
vmap <F3> <Esc>:nohlsearch<CR>gv

" Сохранить файл
nmap <F2> :w!<CR>
imap <F2> <Esc>:w!<CR>
vmap <F2> <Esc>:w!<CR>

" Закрыть VIM
"nmap <F5> :q<CR>
"imap <F5> <Esc>:q<CR>
"vmap <F5> <Esc>:q<CR>

" Более привычные Page Up/Down, когда курсор остаётся в той же строке,
" а не переносится вверх/вниз экрана, как при стандартном PgUp/PgDown.
" Поскольку по умолчанию прокрутка по C-U/D происходит на полэкрана,
" привязка делается к двойному нажатию этих комбинаций.
nmap <PageUp> <C-U><C-U>
imap <PageUp> <C-O><C-U><C-O><C-U>
nmap <PageDown> <C-D><C-D>
imap <PageDown> <C-O><C-D><C-O><C-D>


" Горячие клавиши <--
