set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'


"all of your Plugins must be added before the following line"
call vundle#end()            " required
filetype plugin indent on    " required
syntax enable
colorscheme monokai
autocmd FileType python set breakindentopt=shift:4
set whichwrap=b,s,<,>,[,]
set backspace=indent,eol,start
set relativenumber 
" Command-line based features
if has('cmdline_info')
    set ruler
    " Show the keystrokes being entered in the screen
    set showcmd
    " Show the mode we're using if not normal mode
    set showmode
endif

" Use UTF-8 by default wherever possible
if has('multi_byte')
   set encoding=utf-8
endif

" Adopt the indent of the last line on new lines; interestingly, plugins that
" " do clever things with indenting will often assume this is set
set autoindent
 

"Use spaces instead of tabs
set expandtab

" Indent with four spaces when an indent operation is used
set shiftwidth=4
" Insert four spaces when Tab is pressed
set softtabstop=4
" How many spaces to show for a literal tab when 'list' is unset
set tabstop=4
" Indent intelligently to 'shiftwidth' at the starts of lines with Tab, but
" use 'tabstop' everywhere else
set smarttab
" When indenting lines with < or >, round the indent to a multiple of
" 'shiftwidth', so even if the line is indented by one space it will indent
" up to 4 and down to 0, for example
set shiftround

"Keep a bunch of history
set history=2000
"Match all kinds of brackets

set matchpairs=(:),{:},[:],<:>
" Always tell me the number of lines changed by a command
set report=0
" Always use forward slashes, I very seldom need to use Vim on Windows for
" " more than scratch space anyway
set shellslash

" Allow the cursor to get to the top or bottom of the screen before scrolling
" " vertically, but set a reasonably wide gutter for scrolling horizontally;
" no
" " particular reason, just suits me better
set scrolloff=0
set sidescrolloff=16

" Don't bother drawing the screen while executing macros or other automated or
 " scripted processes, just draw the screen as it is when the operation
 " " completes
set lazyredraw
 "
 " " Improve redrawing smoothness by assuming that my terminal is reasonably
 " " fast
set ttyfast
 "
 " " Never use any kind of bell, visual or not
set visualbell t_vb=
" When wrapping, j and k should move by screen row, and not to the same
" " column number in the previous logical line, which feels very clumsy and is
" " seldom particularly helpful; you can use n| to jump to the nth column in a
" " line anyway if you need to
nnoremap j gj
nnoremap k gk
