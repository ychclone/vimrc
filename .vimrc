" YCH vimrc
" version = 3.1

" +-----------------------------+
" | Plugins delcared in advance |
" +-----------------------------+
function! LoadProfileLoaderConfig()
	if has('win32')
		let configFile = $USERPROFILE.'\_profile_loader_vim_config'
	else
		let configFile = $HOME.'/_profile_loader_vim_config'
	endif
	
	" note: readfile fileformat should be unix
	if filereadable(configFile)
		for settingLine in readfile(configFile)
			exec settingLine
		endfor
	endif
endfunction

" +---------------------+
" | Environment Setting |
" +---------------------+
	let $PYTHONHOME='C:\Python27'
	let $PYTHONPATH='C:\Python27\Lib'
" +-----------------+
" | General setting |
" +-----------------+
	:filetype plugin on

	syntax on
		
	set matchtime=2

	" for cursorhold
	set updatetime=500

	" Show matching parenthese.
	set showmatch

	set autochdir
	
	" Makefile 
	au FileType make let b:match_words= 'ifeq\|ifneq\|ifdef\|ifndef:else:endif'

	if has("win32")
		if isdirectory("w:\\") " only use if w:\ exists
			set viminfo='20,\"0,\/0    " max20 files to remember mark, not remembering registers, search history
			set viminfo+=n\w:\\_viminfo
		endif	
	endif

	" set modeline
	" vim: ts=2:
	" :command -nargs=* Make make <args> | cwindow 3
   
	colo default
	set background=light
	set autoread
	filetype detect
	
	"colorscheme desert
	if has("gui_running")
		set guioptions-=T
		set guioptions-=m
		set guioptions-=e
		
		if has("win32") 
			set guifont=Consolas:h13
			"set guifont=Inconsolata:h11
		endif

		if has("unix")
			set guifont=Inconsolata\ Medium\ 23
			"set guifont=Monospace\ 15
			set linespace=2
		endif
	endif

	" set swap directory
	if isdirectory($TEMP)
		set directory=$TEMP
	endif

	let g:ConqueTerm_PyExe = 'D:/Python27/python.exe'

	"au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
	
	call LoadProfileLoaderConfig()

	set foldmethod=marker

	" speed up syntax highlighting
	augroup syntax_highlight_speedup
		autocmd!
		autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
	augroup END
	
	" regular expression engine
	set regexpengine=0

" +--------------+
" | User setting |
" +--------------+
	let bUseGlobal = 1

	" use logMsg for printing variable
	let bUseLogMsg = 1

	" use SIM_TRACE0 or SIM_TRACE1 for printing variable
	let bUseSimTrace = 0

	let bUseSystemOutPrintln = 0

	let bUseConsoleLog = 1

	" option to allow only tag list for 1 file
	let Tlist_Show_One_File = 1

" +-------------------------+
" | Search setting/shortcut |
" +-------------------------+

	set incsearch      " best match so far

	" make searches case-insensitive, unless they contain upper-case letters
	set ignorecase
	set smartcase

	nnoremap n nzz
	nnoremap N Nzz

" +-------------------------+
" | Screen movement setting |
" +-------------------------+
	" setting relating to horizontal scroll
	set sidescroll=20
	set virtualedit=all
	set nostartofline

" +---------------------+
" | Screen edit setting |
" +---------------------+
	if has("gui_running")
		if has("win32")
			set lines=9999
			set columns=9999
		endif
	endif

	" no expand tab for make filetype
	if has("autocmd")
		autocmd FileType make set noexpandtab
		autocmd FileType jade set noexpandtab
		autocmd FileType pug set noexpandtab
		autocmd FileType python set expandtab

		autocmd FileType scala set expandtab
		autocmd FileType js set expandtab
	endif

	" Default backspace like normal
	set backspace=2

	set tabstop=4
	set nowrap

	set fileformats=unix,dos,mac fileformat=unix " when read a dos file, read as dos format and save as dos format

	set backspace=indent,eol,start
	set shiftwidth=4
	set autoindent     " always set autoindenting on

	set history=10     " keep 10 lines of command line history
	set ruler          " show the cursor position all the time
	set showcmd        " display incomplete commands

	set formatoptions=mtcql
	set formatoptions+=n " also recognize list
	set formatoptions-=o " no continue comment after new line

	" Add spaces after comment delimiters by default
	let g:NERDSpaceDelims = 1

	" disable vim-go plugin version warning
	let g:go_version_warning = 0

	" remove trailing white space
	autocmd BufWritePre *.c :%s/\s\+$//e
	autocmd BufWritePre *.cpp :%s/\s\+$//e
	autocmd BufWritePre *.html :%s/\s\+$//e
	autocmd BufWritePre *.js :%s/\s\+$//e
	autocmd BufWritePre *.erl :%s/\s\+$//e
	autocmd BufWritePre *.hrl :%s/\s\+$//e
	autocmd BufWritePre *.go :%s/\s\+$//e
	autocmd BufWritePre *.jade :%s/\s\+$//e
	autocmd BufWritePre *.java :%s/\s\+$//e 

	autocmd BufWritePre *.h :%s/\s\+$//e
	autocmd BufWritePre *.hpp :%s/\s\+$//e

	autocmd BufWritePre *.vue :%s/\s\+$//e
	autocmd BufWritePre *.yaml :%s/\s\+$//e

" +--------------------------+
" | Screen movement shortcut |
" +--------------------------+
    " move left, right word exclusive 
	nnoremap <C-Left> B
	nnoremap <C-Right> W

	inoremap <C-Left> <C-o>B
	inoremap <C-Right> <C-o>W

	" go to middle column
	noremap E gm
	" scroll horizontal left and right
	nnoremap <S-Left> zh
	nnoremap <S-Right> zl
	" vertical scroll while cursor remains
	nnoremap <S-Up> 1<C-U>
	nnoremap <S-Down> 1<C-D>
	" ctrl up and down = slightly fast up and down 
	nnoremap <C-Up> 10<Up>
	nnoremap <C-Down> 10<Down>
	
	" ctrl page up and down = super fast scroll
	"noremap <C-PageUp> 10<PageUp>
	"noremap <C-PageDown> 10<PageDown>

	" shortcut for quickfix window
	nnoremap <A-cr> :cw<cr>:cc<cr>
	"nnoremap <A-Up> :cw<cr>:cp<cr>zz
	"nnoremap <A-Down> :cw<cr>:cn<cr>zz

	" if set wrap option used, then allow move to next screen line instead of physical link
	nnoremap <silent> <up> gk
	inoremap <silent> <up> <C-o>gk
	nnoremap <silent> <down> gj
	inoremap <silent> <down> <C-o>gj
	nnoremap <silent> <home> ^

	" scroll horizontal left and right
	inoremap <S-Left> <C-o>zh
	inoremap <S-Right> <C-o>zl
	" vertical scroll while cursor remains 
	inoremap <S-Up> <C-o>1<C-U>
	inoremap <S-Down> <C-o>1<C-D>
	" ctrl up and down = slightly fast up and down
	inoremap <C-Up> <C-o>10<Up>
	inoremap <C-Down> <C-o>10<Down>
	
	" ctrl page up and down = super fast scroll
	"inoremap <C-PageUp> 10<PageUp>
	"inoremap <C-PageDown> 10<PageDown>

	" for viewing function name
	nnoremap [[ [[<Up>
	
	func SaveLastSearchPattern()
		let g:lastSearchPattern = getreg("\/")
	endfunc

	func RestoreLastSearchPattern()
		call setreg("\/", g:lastSearchPattern)
	endfunc

	" searching for date format
	"nnoremap ( :call SaveLastSearchPattern()<CR>?^[0-9][0-9]\/[0-9][0-9]\/[0-9][0-9]<CR>:call RestoreLastSearchPattern()<CR>
	"nnoremap ) :call SaveLastSearchPattern()<CR>/^[0-9][0-9]\/[0-9][0-9]\/[0-9][0-9]<CR>:call RestoreLastSearchPattern()<CR>


" +----------------------+
" | Screen edit shortcut |
" +----------------------+
	nnoremap <C-Del> dw
	" select the current word under cursor and copy to clipboard
	nnoremap vc viw"+y

	" undo like windows
	inoremap <C-Z> u
	
    " escape string in clipboard
	if has('win32') 
		nmap ,e :let @*=escape(@*, '\\/.*$^~[]')<CR>
	else
		nmap ,e :let @+=escape(@+, '\\/.*$^~[]')<CR> 
	endif
	
	" copying word under cursor without selecting the word, using C-c in insert mode
	imap <C-c> <Right><Esc>:let curnow=col(".")<CR>vc:call cursor(0,<C-R>=curnow<CR>)<CR>i

	" pasting word without moving cursor
	inoremap <C-g> <Right><Esc>:let curnow=col(".")<CR>"+gP:call cursor(0,<C-R>=curnow<CR>)<CR>i

	"inoremap <C-Del> <C-o>cw      <-- old <c-del> command
	inoremap <C-Del> x<ESC>xcw
	"inoremap <C-BS> <C-W>

	" cut
	vnoremap <C-X> "+x
	
	" copy
	vnoremap <C-C> "+y

	vnoremap <C-S> :sort u<CR>

	" for shifting block
	vnoremap < <gv
	vnoremap > >gv

	cnoremap <C-v> <C-R>=getreg('+')<CR>

	cnoremap <C-c> set autochdir
	cnoremap <C-j> set filetype=javascript<CR>
	cnoremap <C-p> set encoding=cp936<CR>
	cnoremap <C-t> set filetype=trace<CR>
	cnoremap <C-u> set encoding=utf-8<CR>
	cnoremap <C-o> set filetype=proto<CR> 

	cnoremap <C-w> filetype indent on<CR>:set filetype=html<CR>:set smartindent<CR>

	" for visual bookmark
	" nnoremap <silent>bc :exe 'sign unplace '.line(".")<CR>
	" nnoremap <silent>bm :exe 'sign   place '.line(".").' name=bookmark line='.line(".").' buffer='.winbufnr(0)<CR> 
	
	"nme <silent>PopUp.bookmark_&x :exe 'sign unplace '.line(".")<CR>
	"nme <silent>PopUp.bookmark_&a :exe 'sign   place '.line(".").' name=bookmark line='.line(".").' buffer='.winbufnr(0)<CR>
	sign define bookmark linehl=DiffDelete

	ab dt# <C-R>=strftime("%d/%m/%y")<CR>
	ab tm# <C-R>=strftime("%H:%M")<CR>

	"inoremap <A-Left> <C-o>10zh<CR>
	"inoremap <A-Right> <C-o>10zl<CR> 

	" Use Ctrl-B for undo in insert mode
	inoremap <C-B> <C-o>u

	inoremap <C-E> <ESC>:e
	inoremap <C-V> <C-o>"+gP

	"inoremap <C-S> <C-o>:up<CR>   <-- old <c-s> command
	inoremap <C-S> x<ESC>x:up!<CR>i

	" undo like windows
	inoremap <C-Z> <C-O>u

	" printf variable
	"nmap <C-b> :let $printfSub=""<Left>
	"inoremap <C-b> <C-o>:let $printfSub=""<Left> 

	vmap <C-d> "+y<ESC>
				\o<C-R>=GetVarDebugMsg(getreg("+"))<CR><ESC>
	nmap <C-d> :let $currentWord=expand("<cword>")<CR>
				\o<C-R>=GetVarDebugMsg($currentWord)<CR><ESC>
	vmap <C-b> "+y<ESC>
				\o<C-R>=GetInDebugMsg(getreg("+"))<CR><ESC>
	nmap <C-b> :let $currentWord=expand("<cword>")<CR> 
				\o<C-R>=GetInDebugMsg($currentWord)<CR><ESC> 
	vmap ,h "+y<ESC>
				\o<C-R>=GetHexDebugMsg(getreg("+"))<CR><ESC>
	nmap ,h :let $currentWord=expand("<cword>")<CR> 
				\o<C-R>=GetHexDebugMsg($currentWord)<CR><ESC> 

	" text zoom
	nnoremap <A-=> :silent! let &guifont = substitute(&guifont, ':h\zs\d\+', '\=eval(submatch(0)+1)', '')<CR><CR>
	nnoremap <A--> :silent! let &guifont = substitute(&guifont, ':h\zs\d\+', '\=eval(submatch(0)-1)', '')<CR><CR>

	vnoremap bf zf
	vnoremap bc zc
	vnoremap bR zR
	vnoremap bM zM
	
	inoremap <f11> z

	noremap bc zc 

" +-----------------------------+
" | Buffer/window/file shortcut |
" +-----------------------------+
	nnoremap ;s :mksession! ~/mysession.vim<CR>
	nnoremap ;l :source ~/mysession.vim<CR>

	" delete buffer
	nnoremap bd :bd<CR>

	" previous and next file in buffer
	nmap <A-Left> :bp!<CR>
	nmap <A-Right> :bn!<CR>

	nnoremap <unique> <special> <A-[> :bn!<CR>

	nnoremap <C-E> :e<Space>

	" saved only when it is modified
	nnoremap <C-S> :up!<CR>

	" save buffer setting
	cnoremap <A-w> wv!<CR>
	
	cnoremap <A-l> call SettingForLargeFile()<CR>

	" change to current directory
	cnoremap <A-c> cd %:p:h<CR>

	" set current directory as home directory for fzf
	cnoremap <A-h> cd %:p:h<CR><ESC>mH

	func GetVarDebugMsg(varName)
		let varName = a:varName
		if g:bUseLogMsg
			let debugMsg = "logMsg(\"" . varName . " = %d (%s:%d)\\n\", " . varName .",__FILE__,__LINE__,0,0,0);"
			"let debugMsg = "logMsg(\"" . varName . " = %d (%s:%d)\\n\", " . varName .",__FILE__,__LINE__);"
			"let debugMsg = "qDebug() << \"" . varName . " = \" << " . varName .";"
		else
            let debugMsg = "printf(\"" . varName . " = %d (%s:%d)\\n\", " . varName .",__FILE__,__LINE__);" 
		endif
		if g:bUseSimTrace
			let debugMsg = "SIM_TRACE1(\"" . varName . " = %d\\n\", " . varName .");"
		endif

		let currentExt = expand("%:e") " filename without extension  
		if currentExt == "go" 
			let debugMsg = "logger.Trace.Printf(\"" . varName . " = %v\", " . varName .")"
		endif
		if currentExt == "js" 
			let debugMsg = "console.log(\'" . varName . " = \', " . varName .");"
		endif
		if currentExt == "ts" || currentExt == "vue" || currentExt == "tsx"
			let debugMsg = "console.log(\'" . varName . " = \', " . varName .");"
		endif
		if currentExt == "java" 
			let debugMsg = "System.out.println(\"" . varName . " = \" + " . varName .");"
		endif
		if currentExt == "scala"
            if match(varName, '[\.,(,)]') >= 0
                let debugMsg = "println(s\"" . varName . " = ${" . varName ."}\")"
            else 
                let debugMsg = "println(s\"" . varName . " = $" . varName ."\")" 
            endif
		endif
		if currentExt == "kt"
            if match(varName, '[\.,(,)]') >= 0
                let debugMsg = "println(\"" . varName . " = ${" . varName ."}\")"
            else 
                let debugMsg = "println(\"" . varName . " = $" . varName ."\")" 
            endif
		endif

		return debugMsg
	endfunc

	func GetInDebugMsg(varName)
		let varName = a:varName 
		if g:bUseLogMsg
			let debugMsg = "logMsg(\"" . varName . " IN (%s:%d)\\n\",__FILE__,__LINE__,0,0,0,0);"
			"let debugMsg = "logMsg(\"" . varName . " IN (%s:%d)\\n\",__FILE__,__LINE__);" 
			"let debugMsg = "qDebug(\"" . varName . " IN (%s:%d)\",__FILE__,__LINE__);"  
		else
			let debugMsg = "printf(\"" . varName . " IN (%s:%d)\\n\",__FILE__,__LINE__);" 
		endif
		if g:bUseSimTrace
			let debugMsg = "SIM_TRACE0(\"" . varName . " IN\\n\");"
		endif

		let currentExt = expand("%:e") " filename without extension 
		if currentExt == "go"
			let debugMsg = "logger.Trace.Printf(\"" . varName . " IN\")"
		endif
		if currentExt == "js"
			let debugMsg = "console.log(\'" . varName . " IN\');"
		endif 
		if currentExt == "ts" || currentExt == "vue" || currentExt == "tsx"
			let debugMsg = "console.log(\'" . varName . " IN\');"
		endif 
		if currentExt == "java"
			let debugMsg = "System.out.println(\"" . varName . " IN\");"
		endif
		if currentExt == "scala"
			let debugMsg = "pprint.pprintln(" . varName .")"
			let debugMsg = "println(\"=== " . varName . " begin ===\")\r" . debugMsg
			let debugMsg = debugMsg . "\rprintln(\"=== " . varName . " end ===\")\r"
		endif 
		if currentExt == "kt"
			let debugMsg = "println(\"" . varName . " IN\")"
		endif 

		return debugMsg
	endfunc

	func GetHexDebugMsg(varName)
		let varName = a:varName

		let currentExt = expand("%:e") " filename without extension  
		if currentExt == "go" 
			let debugMsg = "Trace.HexDump(\"" . varName . "\", " . varName .")"
		endif
		return debugMsg
	endfunc

	func GetSourceFile()
		let currentFileName = expand("%:r") " filename without extension
		let cExt = currentFileName . '.c'
		let cppExt = currentFileName . '.cpp'
		let ccExt = currentFileName . '.cc'

        let cExtSrcFolder = "../src/" . cExt
		let cppExtSrcFolder = "../src/" . cppExt  

		if filereadable(cExt)
			return cExt
		endif
		if filereadable(cppExt)
			return cppExt
		endif
		if filereadable(ccExt)
			return ccExt
		endif
		if filereadable(cExtSrcFolder)
			return cExtSrcFolder
		endif
		if filereadable(cppExtSrcFolder)
			return cppExtSrcFolder
		endif


		return ''
	endfunc

	func GetHeaderFile()
		let currentFileName = expand("%:r") " filename without extension
		let hExt = currentFileName . '.h'
		let hppExt = currentFileName . '.hpp'
		let hExtIncludeFolder = "../include/" . hExt
		let hppExtIncludeFolder = "../include/" . hppExt 

		if filereadable(hExt)
			return hExt
		endif
		if filereadable(hppExt)
			return hppExt
		endif
		if filereadable(hExtIncludeFolder)
			return hExtIncludeFolder
		endif
		if filereadable(hppExtIncludeFolder)
			return hppExtIncludeFolder
		endif

		return ''
	endfunc

	" yank filename or filepath to clipboard
	if has('win32')
		nmap ,yf :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
		nmap ,yp :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>
		nmap ,yd :let @*=substitute(expand("%:p:h"), "/", "\\", "g")<CR> 
	else
		nmap ,yf :let @+=expand("%")<CR>
		nmap ,yp :let @+=expand("%:p")<CR>
		nmap ,yd :let @+=expand("%:p:h")<CR> 
	endif

	" edit .cpp .hpp shortcut
	cnoremap <C-s> <C-R>=GetSourceFile()<CR>
	cnoremap <C-h> <C-R>=GetHeaderFile()<CR>

	cnoremap <C-l> set list<CR>
	cnoremap <C-n> set nolist<CR>

	" previous and next file in buffer
	imap <A-Left> <C-o>:bp!<CR>
	imap <A-Right> <C-o>:bn!<CR>

	if has("win32")
		cnoremap <C-d> <C-R>=$USERPROFILE<CR>\Desktop
	endif

	" for preview window
	nnoremap zp <C-w>z

	" for previous quick fix result
	nnoremap _ :colder<CR>
	nnoremap + :cnewer<CR>

	" quickfix window on
	nnoremap co :cw<cr>
	" quickfix window off
	nnoremap cf :ccl<cr>

	nnoremap <kPlus> :TlistShowPrototype<CR>
	inoremap <unique> <special> <A-[> <C-o>:bn!<CR>

	if has("win32")
		nnoremap <A-s> :ConqueTerm cmd<CR>
	elseif has("unix")
		nnoremap <A-s> :ConqueTerm bash<CR>
	endif

	nnoremap <C-c> :let @+=expand("%")<CR>

" +--------------+
" | Tab shortcut |
" +--------------+
	nmap <C-S-tab> :tabprevious<CR>
	nmap <C-tab> :tabnext<CR>
	map <C-S-tab> :tabprevious<CR>
	map <C-tab> :tabnext<CR>
	imap <C-S-tab> <Esc>:tabprevious<CR>i
	imap <C-tab> <Esc>:tabnext<CR>i

	nmap <C-t> :tabnew<CR>
	nmap <C-n> :tabnew<CR>

	nmap <C-q> :tabclose<CR>
	imap <C-q> <Esc>:tabclose<CR>

" +--------------------+
" | F1 to F12 shortcut |
" +--------------------+
	" set wrap option
	nnoremap <F2> :set wrap<CR>
	" saved and quit
	nnoremap <F3> :up!<CR>:q<CR>
	" no save and quit
	nnoremap <F4> :q!<CR>

	" refresh
	nnoremap <F5> :e!<CR>

	if has("win32")
		nnoremap <F6> :silent !explorer /e, .<CR><CR>
	endif

	if has("linux")
		nnoremap <F6> :silent !nautilus .<CR><CR>
	endif

	nnoremap <F7> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

	" toggle highlight search result
	nnoremap <f8> :set hls!<bar>set hls?<cr>
	" toggle on/off paste mode
	"noremap <f9> :set paste!<bar>set paste?<cr>
	"set pastetoggle=<f9>

	" Tlist
	" nnoremap <silent> <f11> :Tlist<CR>:set title titlestring=%<%f\ %([%{Tlist_Get_Tag_Prototype_By_Line()}]%)<CR>
	
	inoremap <F3> <ESC>:up!<CR>:q<CR>
	inoremap <F4> <ESC>:q!<CR>
	
	inoremap <F7> <C-R>=strftime(" /* YCH modified %d/%m/%y, ").$CS." */"<CR>
	inoremap <F8> <C-R>=strftime("/* YCH modified (begin) %d/%m/%y, ").$CS." */"<CR>
	inoremap <F9> <C-R>=strftime("/* YCH modified  (end)  %d/%m/%y, ").$CS." */"<CR>
	inoremap <F10> <C-R>=strftime("/* YCH modified %d/%m/%y, ").$CS." */"<CR>

	function! TraceToggleWin32()
		if (&background == "dark")
			colo default
			set background=light
			set guifont=Lucida_Console:h12:cANSI
			set autoread
			filetype detect
		else
			colo desert
			set background=dark
			set guifont=Consolas:h11
			"set guifont=Inconsolata:h11
			set noautoread
			filetype detect
		endif
	endfunction

	function! TraceToggleUnix()
		if (&background == "dark")
			colo default
			set background=light
			set autoread
			filetype detect
		else
			colo desert
			set background=dark
			set guifont=Inconsolata\ Medium\ 26
			set noautoread
			filetype detect
		endif
	endfunction

	function! ColorToggleWin32()
		if (&background == "dark")
			colo summerfruit256
			set background=light
			set guifont=Consolas:h10:b:cANSI 
			"set guifont=Inconsolata_LGC:h10:b:cANSI
			set noautoread 
			filetype detect
		else
			colo desert
			set background=dark
			set guifont=Inconsolata:h11
			set noautoread
			filetype detect
		endif
	endfunction


	" orig = function! <SID>OutlineToggle()

	" Toggle syntax outline
	function! OutlineToggle()
	let OldLine = line(".")
	let OldCol = virtcol(".")
	if (! exists ("b:outline_mode"))
	let b:outline_mode = 0
	let b:OldMarker = &foldmarker
	endif

	if (b:outline_mode == 0)
	let b:outline_mode = 1
	set foldmethod=marker
	set foldmarker={,}
	silent! exec "%s/{{{/{<</"
	silent! exec "%s/}}}/}>>/"
	set foldcolumn=4
	else
	let b:outline_mode = 0
	set foldmethod=marker
	let &foldmarker=b:OldMarker
	silent! exec "%s/{<</{{{/"
	silent! exec "%s/}>>/{{{/"
	set foldcolumn=0
	endif

	execute "normal! ".OldLine."G"
	execute "normal! ".OldCol."|"
	unlet OldLine
	unlet OldCol
	execute "normal! zv"
	endfunction

	"*****************************************************************
	"* Commands
	"*****************************************************************
	":command! -nargs=0 FOLD call <SID>OutlineToggle()
	" End of code

    nnoremap <F12> :call EnableShiftSelect()<CR>
	inoremap <F12> <C-o>:call DisableShiftSelect()<CR>

" +------------------------+
" | C-F1 to C-F12 shortcut |
" +------------------------+
    nnoremap <C-F4> :color default<CR>:set background=dark<CR>
	nnoremap <C-F5> :e $MYVIMRC<CR>

	if has("win32") 
		nnoremap <C-F6> :set guifont=Courier_New:h13:cANSI<CR>
	else
        nnoremap <C-F6> :set guifont=Sans\ 14<CR>
	endif
	nnoremap <C-F7> :set guifont=Consolas:h11<CR>
	"nnoremap <C-F7> :set guifont=Inconsolata:h11<CR>

	if has("win32")
		nnoremap <C-F8> :!start cmd .<CR>
	endif

	if has("win32") 
		nnoremap <C-F9> :call TraceToggleWin32()<CR>
	endif 

	if has("unix") 
		nnoremap <C-F9> :call TraceToggleUnix()<CR>
	endif

	if has("win32") 
		nnoremap <C-F10> :call ColorToggleWin32()<CR>
	endif 

	nnoremap <C-F11> :TidyXML<CR>:set filetype=xml<CR>
	"nnoremap <C-F12> :set guifont=MingLiU:h8:cANSI<CR>:set lines=8<CR>:set columns=154<CR>:winpos 273 791<CR>

	nnoremap <silent> <C-F12> :cal OutlineToggle()<CR>

" +---------------+
" | Mouse setting |
" +---------------+
	" no paste text when middle wheel pressed
	nnoremap <MiddleMouse> <Nop>
	nnoremap <2-MiddleMouse> <Nop>

	inoremap <MiddleMouse> <Nop>
	inoremap <2-middlemouse> <Nop>

" +------------+
" | File search |
" +------------+
	function! s:find_git_root()
	  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
	endfunction

	command! ProjectFiles execute 'Files' s:find_git_root()

	nnoremap ,p :ProjectFiles<CR>

" +------------+
" | Tag search |
" +------------+
	nnoremap ,f :call FilteringNew().addToParameter('alt', @/).run()<CR>

	" using ag to search, ignore file pattern defined in ~/.agignore
	let $FZF_DEFAULT_COMMAND = 'ag -g ""'
	nnoremap <C-f> `H:cd %:p:h<CR>:FZF<cr>

	if has("win32")
		if isdirectory("w:\\")
			if bUseGlobal         
				"set grepprg=C:\ut\global\bin\global
				set grepprg=d:\ut\profile_loader\build\qTag
				"set grepformat=%*[^\ ]%*[\ ]%l%*[\ ]%f%*[\ ]%m
				set grepformat=%f:%l%m

				"let $GTAGSDBPATH="W:\\"

				if !executable(&grepprg)
					let choice = confirm("Note: Program " . &grepprg . " not avaliable for tag search", "&Ok", 1)
				endif

				"nnoremap ;r :grep! -aGxt --result=grep <c-r>=expand("<cword>")<cr><cr><cr>:cw<cr>
				"nnoremap ;f :grep! -arxt --result=grep <c-r>=expand("<cword>")<cr><cr><cr>:cw<cr>
				"nnoremap ;s :grep! -asxt --result=grep <c-r>=expand("<cword>")<cr><cr><cr>:cw<cr>
				
				nnoremap ;r :grep! -q <c-r>=expand("<cword>")<cr><cr><cr>:cw<cr>
				nnoremap ;f :grep! -q <c-r>=expand("<cword>")<cr><cr><cr>:cw<cr>
				"nnoremap ;s :grep! -q <c-r>=expand("<cword>")<cr><cr><cr>:cw<cr>


				"nnoremap <C-f> :gr! -agx 
				"nnoremap <C-f> :gr! -arxt --result=grep 
				"inoremap <C-f> <C-o>:gr! -arxt --result=grep 
                
				"nnoremap <C-f> :gr! -q 
				"inoremap <C-f> <C-o>:gr! -q 
				
			else
				" search in files for currnet word under cursor using gid
				"set grepprg=lid2\ -Rgrep
				set grepprg=D:\ut\mkid-win32-bin\gid

				nnoremap ;a :grep! -fw:\all_id <c-r>=expand("<cword>")<cr><cr><cr>:cw<cr>
				nnoremap ;c :grep! -fw:\c_id <c-r>=expand("<cword>")<cr><cr><cr>:cw<cr>
				nnoremap ;h :grep! -fw:\h_id <c-r>=expand("<cword>")<cr><cr><cr>:cw<cr>

				"nnoremap ;a :grep! -R grep -fw:\all_id <c-r>=expand("<cword>") \| ahead C:
                
				" search in files using gid
				"nnoremap <C-f> :gr! -fw:\all_id 
				"inoremap <C-f> <C-o>:gr! -fw:\all_id 

			endif
		endif
	endif

	"if has("win32")
	"	set tags=./tags,w:\tags
	"endif

	nnoremap <C-l> :let $CS=""<Left>
	inoremap <C-l> <C-o>:let $CS=""<Left>

	nnoremap <C-j> :let bUseLogMsg=
	inoremap <C-j> <C-o>:let bUseLogMsg=

	"nnoremap <C-j> :let bUseSystemOutPrintln=
	"inoremap <C-j> <C-o>:let bUseSystemOutPrintln
	
	"nnoremap <C-j> :let bUseSimTrace=
	"inoremap <C-j> <C-o>:let bUseSimTrace=

" +----------------+
" | Plugin setting |
" +----------------+
	" neocomplete
	let g:neocomplete#enable_at_startup = 1
	inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
	inoremap <expr><Down> pumvisible() ? "\<C-n>" : "\<Down>"
	inoremap <expr><Up> pumvisible() ? "\<C-p>" : "\<Up>"

	set completeopt-=preview

	" enter for select
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
		return pumvisible() ? "\<C-y>" : "\<CR>"
	endfunction

	" vim go
	let g:go_fmt_autosave = 0

" +------------------+
" | Screen highlight |
" +------------------+
	cnoremap <C-a> :AnsiEsc<CR>
	"let c_space_errors = 1 " for highlighting trailing white space

if has("gui_running")
	if (exists("g:colors_name"))
		if (g:colors_name == "desert")
			hi TabLineFill guifg=grey30
			hi TabLine guifg=grey50 guibg=grey30
			hi TabLineSel guibg=grey30 guifg=grey60
		endif
	endif
endif

" setting for reading large file
function! SettingForLargeFile()
	set ft= 
	set syn=
	syntax off
	set noswapfile
endfunction


" +---------+
" | Plugins |
" +---------+
function! EnableShiftSelect()
    " for later unmap
	inoremap <S-Left> <C-o>zh
 	inoremap <S-Right> <C-o>zl
 	inoremap <S-Up> <C-o><C-U>
 	inoremap <S-Down> <C-o><C-D>

	" scroll horizontal left and right
	iunmap <S-Left>
	iunmap <S-Right>
	" vertical scroll while cursor remains
	iunmap <S-Up>
	iunmap <S-Down>
	behave mswin 
	startinsert
endfunction

function! DisableShiftSelect()
	behave xterm 
	" scroll horizontal left and right 
	inoremap <S-Left> <C-o>zh
 	inoremap <S-Right> <C-o>zl
	" vertical scroll while cursor remains 
 	inoremap <S-Up> <C-o>1<C-U>
 	inoremap <S-Down> <C-o>1<C-D>

	stopinsert
endfunction

" +-------------------+
" | VIM plug/ VimPlug |
" +-------------------+
call plug#begin('~/.vim/plugged')
Plug 'derekwyatt/vim-scala'
Plug 'fatih/vim-go'
Plug 'vim-scripts/Quich-Filter'
Plug 'scrooloose/nerdcommenter'
Plug 'digitaltoad/vim-pug'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'junegunn/fzf' 
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'shime/vim-livedown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish' 
Plug 'sheerun/vim-polyglot'
Plug 'dylon/vim-antlr'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()  

"
function! TidyXML()
	silent %!xmllint --format --recover -
endfunction

command! TidyXML call TidyXML()

" +--------------------+
" | Coc                |
" +--------------------+
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType cpp,typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



