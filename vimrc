 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'
 
 "from vim repo
 Bundle 'ScrollColors'
 Bundle 'Color-Sampler-Pack'
 Bundle 'L9'
 Bundle 'FuzzyFinder'
 Bundle  'MRU'

 "from git repo
 Bundle 'Lokaltog/vim-powerline'

 " color scheme
 colorscheme silent
 set number
 syntax on
 hi Pmenu ctermbg=0xFF00FF

 " power line
 set laststatus=2   " Always show the statusline
 set encoding=utf-8 " Necessary to show unicode glyphs
 let g:Powerline_symbols = 'fancy'

 " osx - backspace fix
 "set backspace=2
 set backspace=indent,eol,start
