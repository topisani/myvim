if exists(':let') == 0
    finish
endif
set nocompatible               " be iMproved

filetype off                   " required!

"<Leader> key is ,
let mapleader=","

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


"{{{ Vundle Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Shougo/vimproc.vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'tobyS/pdv'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'dyng/ctrlsf.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'sjl/gundo.vim'
Plugin 'alvan/vim-php-manual'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'joonty/vim-taggatron'
Plugin 'ervandew/supertab'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'tobyS/vmustache'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-repeat'
Plugin 'taglist.vim'
"}}}

call vundle#end()            " required
filetype plugin indent on    " required

"{{{ Plugin configs
"{{{ Supertab
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabClosePreviewOnPopupClose = 1

"}}}
"{{{ NERDTree
"Automatically start NERDtree if vim starts with no file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Remove executable highlighting
highlight link NERDTreeExecFile Title
syn match NERDTreeExecFile  #[|` ].\($\)#

let NERDTreeQuitOnOpen = 1
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
"}}}
"{{{ Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 1

"}}}
"{{{ Taggatron
let g:tagcommands = {
\    "php" : {
\        "tagfile" : ".php.tags",
\        "args" : "-R"
\    }
\}
"}}}
"{{{ CtrlSF
nmap     <C-F>s <Plug>CtrlSFPrompt
vmap     <C-F>F <Plug>CtrlSFVwordPath
vmap     <C-F>f <Plug>CtrlSFVwordExec
nmap     <C-F>N <Plug>CtrlSFCwordPath
nmap     <C-F>n <Plug>CtrlSFCwordExec
nmap     <C-F>p <Plug>CtrlSFPwordExec
nmap     <C-F>P <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

"}}}
"{{{ Airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#show_buffers = 0

let g:airline#extensions#hunks#non_zero_only = 1

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#whitespace#enabled = 0

let g:airline#extensions#tmuxline#enabled = 1

function! AirlineInit()
	"let g:airline_section_a = airline#section#create(['mode', ' ', 'foo'])
	"let g:airline_section_b = airline#section#create_left(['ffenc','file'])
	"let g:airline_section_c = airline#section#create(['%{getcwd()}'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()  

"}}}
"{{{ Tagbar
nnoremap <Leader>t :TagbarToggle<CR>
"}}}
"{{{ Taglist
let Tlist_Inc_Winwidth = 0
let Tlist_Close_On_Select = 1
let Tlist_Exit_OnlyWindow = 1

nmap <silent> <Leader>T :TlistToggle<CR>
"}}}
"{{{ EasyMotion
let g:EasyMotion_do_mapping = 1

nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

nmap <Space> <Plug>(easymotion-prefix)


"}}}

"}}}

"{{{ Keybinds

nnoremap <C-d> :call pdv#DocumentWithSnip()<CR>

"}}}

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-d> :call pdv#DocumentWithSnip()<CR>
syntax enable
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
let g:airline_powerline_fonts = 1

"{{{ Functions

"{{{ Open URL in browser

function! Browser ()
    let line = getline (".")
    let line = matchstr (line, "http[^   ]*")
    exec "!google-chrome ".line
endfunction

"}}}
"{{{ Close quickfix with main window close
au BufEnter * call MyLastWindow()
function! MyLastWindow()
    " if the window is quickfix go on
    if &buftype=="quickfix"
        " if this window is last on screen quit without warning
        if winbufnr(2) == -1
            quit!
        endif
    endif
endfunction
"}}}
"{{{ Diff current unsaved file
function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
"}}}
"{{{ Run command and put output in scratch
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
    let isfirst = 1
    let words = []
    for word in split(a:cmdline)
        if isfirst
            let isfirst = 0  " don't change first word (shell command)
        else
            if word[0] =~ '\v[%#<]'
                let word = expand(word)
            endif
            let word = shellescape(word, 1)
        endif
        call add(words, word)
    endfor
    let expanded_cmdline = join(words)
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    call setline(1, 'You entered:  ' . a:cmdline)
    call setline(2, 'Expanded to:  ' . expanded_cmdline)
    call append(line('$'), substitute(getline(2), '.', '=', 'g'))
    silent execute '$read !'. expanded_cmdline
    1
endfunction
"}}}
"{{{ Beautify PHP
function! BeautifyPHP()
    " Get the bytecode.
    let bytecode = system("php_beautifier", join(getline(0, '$'), "\n"))
    normal! ggdG
    " Insert the bytecode.
    
    call append(0, split(bytecode, '\n'))
endfunction
"}}}
"}}}

"{{{ Commands
" Save a file that requires sudoing even when
" you opened it as a normal user.
command! Sw w !sudo tee % > /dev/null
" Show difference between modified buffer and original file
command! DiffSaved call s:DiffWithSaved()

command! BeautifyPHP call BeautifyPHP()
command! Bphp BeautifyPHP

"}}}

"{{{ Settings
set ttyscroll=0
set hidden
set history=1000
set ruler
set ignorecase
set smartcase
set title
set scrolloff=3
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set wrapscan
set clipboard=unnamed
set visualbell
set backspace=indent,eol,start
"Status line coolness
set laststatus=2
set showcmd
" Search things
set hlsearch
set incsearch " ...dynamically as they are typed.
set listchars=tab:>-,trail:·,eol:$
" Folds
set foldmethod=marker
set wildmenu
set wildmode=list:longest,full
set mouse=a
set nohidden
set shortmess+=filmnrxoOt
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
set shell=bash\ --login

"Tabs
set shiftwidth=4
set tabstop=4
set noexpandtab

"Speed highlighting up
set nocursorcolumn
set nocursorline
syntax sync minlines=256

" Line numbers
set number
"}}}

"Fugitive (Git) in status line

"set statusline=%{exists(\"*fugitive#statusline\")?\"branch:\ \".fugitive#statusline():\"\"}\ %F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

let g:NERDTreeMapHelp = "h"


"{{{ Key Maps
" Fast saving
nnoremap <Leader>w :w<CR>
vnoremap <Leader>w <Esc>:w<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
vnoremap <C-s> <Esc>:w<CR>

nnoremap <Leader>x :x<CR>
vnoremap <Leader>x <Esc>:x<CR>

" Stop that damn ex mode
nnoremap Q <nop>

" Quick nohl
nnoremap <Leader>h :nohl<CR>

" Fugitive shortcuts
nnoremap <Leader>c :Gcommit -a<CR>i
nnoremap <Leader>g :Git
nnoremap <Leader>a :Git add %:p<CR>

nnoremap <Leader>bp :BeautifyPHP<CR>
"}}}

" Tree of nerd
nnoremap <Leader>m :NERDTreeTabsToggle<CR>

" Gundo
nnoremap <Leader>u :GundoToggle<CR>



unlet php_sql_query
let php_htmlInStrings = 1
let php_parent_error_open = 1
let php_folding = 0

let g:phpqa_codesniffer_cmd='~/.php/phpcs/scripts/phpcs'
let g:phpqa_messdetector_cmd='~/.php/phpmd/vendor/bin/phpmd'
let g:phpqa_codecoverage_autorun = 1
let g:phpqa_messdetector_autorun = 1
let g:phpqa_messdetector_ruleset = '~/.php/phpmd/phpmd.xml'

let g:phpqa_codesniffer_args = "--standard=Zend"


