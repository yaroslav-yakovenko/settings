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

set showmatch " показывать первую парную скобку после ввода второй
set autoread " перечитывать изменённые файлы автоматически
set title " показывать имя буфера в заголовке терминала
set history=128 " хранить больше истории команд
set undolevels=2048 " хранить историю изменений числом N

" При копировании добавить в иксовый буфер
nmap yy yy:silent .w !xclip<cr>
vmap y y:silent '<,'> w !xclip<cr>

"Показывать строку с позицией курсора
set ruler
"autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand('<cword>'))


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
 "required! 
 Bundle 'gmarik/vundle'

" My Bundles here:
"
Bundle 'git://github.com/mattn/zencoding-vim.git'
Bundle 'git://github.com/scrooloose/nerdcommenter.git'
Bundle 'git://github.com/scrooloose/nerdtree.git'
Bundle 'git://github.com/majutsushi/tagbar.git' 
Bundle 'git://github.com/tomtom/checksyntax_vim.git'
Bundle 'git://github.com/vim-scripts/highlight_current_line.vim.git'
Bundle 'git://github.com/tpope/vim-surround.git'
Bundle 'git://github.com/vim-scripts/bufexplorer.zip.git'

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
au BufRead,BufNewFile *.stpl	setfiletype html

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
set imsearch=0 " аналогично для строки поиска и ввода команд

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

" по звездочке не прыгать на следующее найденное, а просто подсветить
nnoremap * *N
" " выключить подсветку: повесить на горячую клавишу Ctrl-F8
"nnoremap <C-F8> :nohlsearch<CR>
"
" Сохранить файл
nmap <F2> :w!<CR>
imap <F2> <Esc>:w!<CR>
vmap <F2> <Esc>:w!<CR>

" Закрыть VIM
"nmap <F10> :q<CR>
"imap <F10> <Esc>:q<CR>
"vmap <F10> <Esc>:q<CR>

nmap <C-F5> <Esc>:BufExplorerVerticalSplit<cr>
vmap <C-F5> <esc>:BufExplorerVerticalSplit<cr>
imap <C-F5> <esc>:BufExplorerVerticalSplit<cr>

" F6 - предыдущий буфер
nmap <C-F6> :bp<cr>
vmap <C-F6> <esc>:bp<cr>i
imap <C-F6> <esc>:bp<cr>i

" F7 - следующий буфер
nmap <S-F6> :bn<cr>
vmap <S-F6> <esc>:bn<cr>i
imap <S-F6> <esc>:bn<cr>i

" Более привычные Page Up/Down, когда курсор остаётся в той же строке,
" а не переносится вверх/вниз экрана, как при стандартном PgUp/PgDown.
" Поскольку по умолчанию прокрутка по C-U/D происходит на полэкрана,
" привязка делается к двойному нажатию этих комбинаций.
nmap <PageUp> <C-U><C-U>
imap <PageUp> <C-O><C-U><C-O><C-U>
nmap <PageDown> <C-D><C-D>
imap <PageDown> <C-O><C-D><C-O><C-D>


" Горячие клавиши <--
" Восстановление позиции курсора при открытии файла в Vim
if has("autocmd")
    set viewoptions=cursor,folds
    au BufWinLeave * mkview
    au BufWinEnter * silent loadview
endif

function! MyKeyMapHighlight()
	if &iminsert == 0 " при английской раскладке статусная строка текущего окна будет серого цвета
		hi StatusLine ctermfg=DarkBlue guifg=DarkBlue
	else " а при русской - зеленого.
		hi StatusLine ctermfg=DarkGreen guifg=DarkGreen
	endif
endfunction

call MyKeyMapHighlight() " при старте Vim устанавливать цвет статусной строки
autocmd WinEnter * :call MyKeyMapHighlight() " при смене окна обновлять информацию о раскладках
 cmap <silent> <C-^> <C-^>
 imap <silent> <C-^> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
 nmap <silent> <C-^> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
 vmap <silent> <C-^> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv
    " <--

" Задаем собственные функции для назначения имен заголовкам табов -->
function! MyTabLine()
	let tabline = ''

	" Формируем tabline для каждой вкладки -->
	for i in range(tabpagenr('$'))
		" Подсвечиваем заголовок выбранной в данный момент вкладки.
		if i + 1 == tabpagenr()
			let tabline .= '%#TabLineSel#'
		else
			let tabline .= '%#TabLine#'
		endif

		" Устанавливаем номер вкладки
		let tabline .= '%' . (i + 1) . 'T'

		" Получаем имя вкладки
		let tabline .= ' %{MyTabLabel(' . (i + 1) . ')} |'
	endfor
	" Формируем tabline для каждой вкладки <--

	" Заполняем лишнее пространство
	let tabline .= '%#TabLineFill#%T'

	" Выровненная по правому краю кнопка закрытия вкладки
	if tabpagenr('$') > 1
		let tabline .= '%=%#TabLine#%999XX'
	endif

	return tabline
endfunction

function! MyTabLabel(n)
	let label = ''
	let buflist = tabpagebuflist(a:n)

	" Имя файла и номер вкладки -->
	let label = substitute(bufname(buflist[tabpagewinnr(a:n) - 1]), '.*/', '', '')

	if label == ''
		let label = '[No Name]'
	endif

	let label .= ' (' . a:n . ')'
	" Имя файла и номер вкладки <--

	" Определяем, есть ли во вкладке хотя бы один
	" модифицированный буфер.
	" -->
	for i in range(len(buflist))
		if getbufvar(buflist[i], "&modified")
			let label = '[+] ' . label
			break
		endif
	endfor
	" <--

	return label
endfunction

function! MyGuiTabLabel()
	return '%{MyTabLabel(' . tabpagenr() . ')}'
endfunction

set tabline=%!MyTabLine()
set guitablabel=%!MyGuiTabLabel()
" Задаем собственные функции для назначения имен заголовкам табов <--
set wildmenu
set wcm=<Tab>
" проверка орфографии:
menu SetSpell.ru  :set spl=ru spell<CR>
menu SetSpell.en  :set spl=en spell<CR>
menu SetSpell.off :set nospell<CR>
map <F10> :emenu SetSpell.<Tab>
" выбор альтернатив:
imap <F12> <Esc> z=<CR>i
map <F12> z=<CR>


   " Меню Encoding -->
        " Выбор кодировки, в которой читать файл -->
            set wildmenu
            set wcm=<Tab>
            menu Encoding.Read.utf-8<Tab><F7> :e ++enc=utf8 <CR>
            menu Encoding.Read.windows-1251<Tab><F7> :e ++enc=cp1251<CR>
            menu Encoding.Read.koi8-r<Tab><F7> :e ++enc=koi8-r<CR>
            menu Encoding.Read.cp866<Tab><F7> :e ++enc=cp866<CR>
            map <F7> :emenu Encoding.Read.<TAB>
        " Выбор кодировки, в которой читать файл <--

        " Выбор кодировки, в которой сохранять файл -->
            set wildmenu
            set wcm=<Tab>
            menu Encoding.Write.utf-8<Tab><S-F7> :set fenc=utf8 <CR>
            menu Encoding.Write.windows-1251<Tab><S-F7> :set fenc=cp1251<CR>
            menu Encoding.Write.koi8-r<Tab><S-F7> :set fenc=koi8-r<CR>
            menu Encoding.Write.cp866<Tab><S-F7> :set fenc=cp866<CR>
            map <S-F7> :emenu Encoding.Write.<TAB>
        " Выбор кодировки, в которой сохранять файл <--

        " Выбор формата концов строк (dos - <CR><NL>, unix - <NL>, mac - <CR>) -->
            set wildmenu
            set wcm=<Tab>
            menu Encoding.End_line_format.unix<Tab><C-F7> :set fileformat=unix<CR>
            menu Encoding.End_line_format.dos<Tab><C-F7> :set fileformat=dos<CR>
            menu Encoding.End_line_format.mac<Tab><C-F7> :set fileformat=mac<CR>
            map <C-F7> :emenu Encoding.End_line_format.<TAB>
        " Выбор формата концов строк (dos - <CR><NL>, unix - <NL>, mac - <CR>) <--
    " Меню Encoding <--
