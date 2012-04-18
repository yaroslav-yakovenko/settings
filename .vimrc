" Включаем мышку даже в текстовом режиме
" (очень удобно при копировании из терминала, т. к. без этой опции,
" например, символы табуляции раскладываются в кучу пробелов).
call pathogen#infect()
call pathogen#helptags()
set mouse=a
set nu
color xoria256
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

" Размер табуляции
set tabstop=4
" Размер сдвига при нажатии на клавиши << и   >>  
set shiftwidth=4
" Копирует отступ от предыдущей строки
set autoindent
" Включаем 'умную' автоматическую расстановку отступов
set smartindent
" Включаем подсветку синтаксиса
syntax on

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

" Отключаем создание бэкапов
set nobackup
" Отключаем создание swap файлов
set noswapfile
"" Все swap файлы будут помещаться в эту папку
"set dir=~/.vim/swp

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

" Необходимо установить для того, чтобы *.h файлам
" присваивался тип c, а не cpp.
let c_syntax_for_h=""

" Просмотр нетекстовых файлов в Vim -->
au BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78
au BufReadPost *.doc silent %!antiword "%"
au BufReadPost *.odt silent %!odt2txt "%"
" Просмотр нетекстовых файлов в Vim <--

" Горячие клавиши -->
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

" Стрелки для комментариев
map - $a --><Esc>
map = $a <--<Esc>

" Запуск/сокрытие плагина Winmanager
map <F1> :WMToggle<CR>
imap <F1> <Esc>:WMToggle<CR>
vmap <F1> <Esc>:WMToggle<CR>

" Запуск/сокрытие плагина Tag List
map <F2> :TlistToggle<CR>
imap <F2> <Esc>:TlistToggle<CR>
vmap <F2> <Esc>:TlistToggle<CR>

" Очистить подсветку последнего найденного выражения
nmap <F3> :nohlsearch<CR>
imap <F3> <Esc>:nohlsearch<CR>
vmap <F3> <Esc>:nohlsearch<CR>gv

" Сохранить файл
nmap <F4> :w!<CR>
imap <F4> <Esc>:w!<CR>
vmap <F4> <Esc>:w!<CR>

" Закрыть VIM
nmap <F5> :q<CR>
imap <F5> <Esc>:q<CR>
vmap <F5> <Esc>:q<CR>

" Более привычные Page Up/Down, когда курсор остаётся в той же строке,
" а не переносится вверх/вниз экрана, как при стандартном PgUp/PgDown.
" Поскольку по умолчанию прокрутка по C-U/D происходит на полэкрана,
" привязка делается к двойному нажатию этих комбинаций.
nmap <PageUp> <C-U><C-U>
imap <PageUp> <C-O><C-U><C-O><C-U>
nmap <PageDown> <C-D><C-D>
imap <PageDown> <C-O><C-D><C-O><C-D>

" Переключение раскладок и индикация выбранной
" в данный момент раскладки.
" -->
" Переключение раскладок будет производиться по <C-F>
"
" При английской раскладке статусная строка текущего окна будет синего
" цвета, а при русской - зеленого.

function MyKeyMapHighlight()
	if &iminsert == 0
		hi StatusLine ctermfg=DarkBlue guifg=DarkBlue
	else
		hi StatusLine ctermfg=DarkGreen guifg=DarkGreen
	endif
endfunction

" Вызываем функцию, чтобы она установила цвета при запуске Vim'a
call MyKeyMapHighlight()

" При изменении активного окна будет выполняться обновление
" индикации текущей раскладки
au WinEnter * :call MyKeyMapHighlight()

cmap <silent> <C-F> <C-^>
imap <silent> <C-F> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
nmap <silent> <C-F> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
vmap <silent> <C-F> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv
" <--

" Omni completion
inoremap <C-B> <C-X><C-O>
" Горячие клавиши <--

" Меню -->
" Включение автоматического разбиения строки на несколько
" строк фиксированной длины
menu Textwidth.off :set textwidth=0<CR>
menu Textwidth.on :set textwidth=75<CR>


" Проверка орфографии -->
if version >= 700
	" По умолчанию проверка орфографии выключена.
	set spell spelllang=
	set nospell

	menu Spell.off :setlocal spell spelllang=<CR>:setlocal nospell<CR>
	menu Spell.Russian+English :setlocal spell spelllang=ru,en<CR>
	menu Spell.Russian :setlocal spell spelllang=ru<CR>
	menu Spell.English :setlocal spell spelllang=en<CR>
	menu Spell.-SpellControl- :
	menu Spell.Word\ Suggest<Tab>z= z=
	menu Spell.Add\ To\ Dictionary<Tab>zg zg
	menu Spell.Add\ To\ TemporaryDictionary<Tab>zG zG
	menu Spell.Remove\ From\ Dictionary<Tab>zw zw
	menu Spell.Remove\ From\ Temporary\ Dictionary<Tab>zW zW
	menu Spell.Previous\ Wrong\ Word<Tab>[s [s
	menu Spell.Next\ Wrong\ Word<Tab>]s ]s
endif
" Проверка орфографии <--


" Обертка для :make -->
function! MyMake()
	" Для *.py файлов не открываем новые вкладки,
	" а просто компилируем текущий файл.
	if &filetype == "python"
		write
		make
		return
	endif

	let old_tab_num = tabpagenr()

	" Создаем новую вкладку
	tabe

	" Помещаем ее в конец
	tabm

	let old_buflist = tabpagebuflist(tabpagenr())
	make
	let buflist = tabpagebuflist(tabpagenr())

	" Если список буферов не изменился, значит, компиляция прошла
	" успешно и можно закрыть только что созданную вкладку - она нам
	" не понадобилась.
	if old_buflist == buflist
		tabc
		execute 'tabn '.old_tab_num
		" Иначе файл с ошибкой откроется в этой вкладке.
	else
		" Раскрываем все складки
		setlocal foldlevel=9999
	endif
endfunction

nmap ,m :call MyMake()<CR>
nmap ,w :cwindow<CR>
nmap ,n :cnext<CR>
nmap ,p :cprevious<CR>
nmap ,l :clist<CR>

menu Make.Make<Tab>,m ,m
menu Make.Make\ Window<Tab>,w ,w
menu Make.Next\ Error<Tab>,n ,n
menu Make.Previous\ Error<Tab>,p ,p
menu Make.Errors\ List<Tab>,l ,l
" Обертка для :make <--


" Обновление ctags -->
function! MyUpdateCtags()
	echo "Update ctags function is not setted."
endfunction

let MyUpdateCtagsFunction = "MyUpdateCtags"
nmap <F11> :call {MyUpdateCtagsFunction}()<CR>

menu ctags.Update<Tab><F11> <F11>
" Обновление ctags <--


" Блог -->
" Преобразование открытого в данный момент файла в HTML код для
" последующей вставки в блог.

function! MyConvertFileToHtmlForBlog()
	runtime syntax/2html.vim
	%s/<br>$//
	%s/\_^\_.*<body[^>]*><font[^>]*>\_\s*/<pre class="my_code_box"><font color="#000000">/
	%s/\_\s*<\/font><\/body>\_.*/<\/font><\/pre>/
endfunction

menu Blog.Convert\ file\ to\ HTML\ for\ blog :silent call MyConvertFileToHtmlForBlog()<CR>
" Блог <--


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


" Перевод слов при помощи консольной версии StarDict -->
function! TranslateWord()
	let s:dict    = "sdcv"
	let s:phrase  = expand("<cword>")
	let s:tmpfile = tempname()

	silent execute "!" . s:dict . " " . s:phrase . " > " . s:tmpfile

	let s:lines = system("wc -l " . s:tmpfile . "| awk '{print $1}'")

	if s:lines == 0
		echo s:phrase . ": Not found."
	else
		execute "botright sp " . s:tmpfile
	end
endfun

map <F9> :call TranslateWord()<CR>
menu Translate.Translate_word<Tab><F9> :call TranslateWord()<CR>
" Перевод слов при помощи консольной версии StarDict <--
" Меню <--


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


" Переключение между заголовочными файлами и
" файлами с исходным кодом.
" -->
"   Соответственно:
"   ,s - переключение на исходный код
"   ,S - тоже самое, только открыть в новом окне
"   ,h - переключение на заголовочный файл
"   ,H - тоже самое, только открыть в новом окне

nmap ,h :call MySwitchToHeader()<CR>
nmap ,H :call MySwitchToHeaderInNewWindow()<CR>
nmap ,s :call MySwitchToSource()<CR>
nmap ,S :call MySwitchToSourceInNewWindow()<CR>

function! MySwitchToHeader()
	if &filetype == "c"
		find %:t:r.h
		return
	end

	if &filetype == "cpp"
		find %:t:r.hpp
		return
	end
endfunction

function! MySwitchToHeaderInNewWindow()
	if &filetype == "c"
		sf %:t:r.h
		return
	end

	if &filetype == "cpp"
		sf %:t:r.hpp
		return
	end
endfunction

function! MySwitchToSource()
	if &filetype == "c"
		find %:t:r.c
		return
	end

	if &filetype == "cpp"
		find %:t:r.cpp
		return
	end
endfunction

function! MySwitchToSourceInNewWindow()
	if &filetype == "c"
		sf %:t:r.c<CR>
		return
	end

	if &filetype == "cpp"
		sf %:t:r.cpp<CR>
		return
	end
endfunction
