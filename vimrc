" System vimrc file for Mac OS X
" Author:  Benji Fisher <benji@member.AMS.org>
" Last modified:  23 February 2004
"
" TODO:  Is there any way to test whether Vim.app was started from the Finder? 
if has("gui_running")
  " Get the value of $PATH from a login shell.
  " If your shell is not on this list, it may be just because we have not
  " tested it.  Try adding it to the list and see if it works.  If so,
  " please post a note to the vim-mac list!
  if $SHELL =~ '/\(sh\|csh\|bash\|tcsh\|zsh\)$'
    let s:path = system("echo echo VIMPATH'${PATH}' | $SHELL -l")
    let $PATH = matchstr(s:path, 'VIMPATH\zs.\{-}\ze\n')
  endif
  " Change directory on startup.
  autocmd VimEnter * if getcwd()=="/" | if strlen(@%) | cd %:p:h | else | cd | endif | endif
" If running in a Terminal window, set the terminal type to allow syntax
" highlighting.
" else
"   set term=ansi
endif

if &shell =~# 'fish$'
    set shell=bash
endif

"execute pathogen#infect()
"runtime! plugin/sensible.vim

"set background=light
colorscheme lucius
LuciusWhite
";colorscheme delek

set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set relativenumber              " always show line numbers
set showmatch                   " set show matching parenthesis
"set ignorecase                  " ignore case when searching
"set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set mouse+=a                     " enable using the mouse if terminal emulator
                                "    supports it (xterm does)
set fileformats="unix,dos,mac"
set ruler
set laststatus=2
set statusline=%f%m%r%h\ [%L]\ [%{&ff}]\ %y%=[%p%%]\ [line:%-5l\ col:%-2v]
" Highlighting {{{
if &t_Co > 2 || has("gui_running")
   syntax on                    " switch syntax highlighting on, when the terminal has colors
endif
" }}}

filetype plugin on
filetype plugin indent on

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

" Vimscript maps ---------------------- {{{
let mapleader = "-"
let maplocalleader = "="

noremap <space> <PageDown>
noremap <c-b> <PageUp>
noremap <leader>b <PageUp>
noremap <leader>f <PageDown>

" change word uppercase/lowercase
nnoremap <c-U> viwU
nnoremap <s-u> viwu

" add quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>E
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>E

" delete quotes
nnoremap <leader>d' F'xf'xE
nnoremap <leader>d" F"xf"xE

" edit .vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" set line number or relative line number
nnoremap <leader>l :set rnu<cr>
nnoremap <leader>L :set nu<cr>

" delete the word under cursor
nnoremap <leader>dw viwxx

" comment out a block until
"nnoremap <leader>c <c-v>}kI#<esc>
"nnoremap <leader>c <c-v>}kI#<esc>

" map jk to ESC
inoremap jk <esc>

" add brackets
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi(<cr>
onoremap il{ :<c-u>normal! F}vi(<cr>
" }}}

augroup file_comment
    autocmd!
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType cpp nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType c nnoremap <buffer> <localleader>c I//<esc>
augroup END

"augroup line_number
    "autocmd!
    "autocmd FocusLost * :set number
    "autocmd FocusGained * :set relativenumber
    "autocmd InsertEnter * :set number
    "autocmd InsertLeave * :set relativenumber
"augroup END
" Vimscript file settings ---------------------- {{{

setlocal foldmethod=indent
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set redrawtime=10000
