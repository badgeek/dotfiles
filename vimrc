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
 Bundle 'MRU'
 Bundle 'jsbeautify'
 Bundle 'Tagbar'
 "Bundle 'NERDtree'
 "Bundle 'Syntastic'

 "from git repo
 Bundle 'Lokaltog/vim-powerline'
 Bundle 'scrooloose/nerdtree'
 Bundle 'scrooloose/syntastic'
 Bundle 'hallettj/jslint.vim.git'
 Bundle 'joestelmach/lint.vim.git'

 let v8_command = '/usr/local/bin/v8'

:python << EOF
import os
virtualenv = os.environ.get('VIRTUAL_ENV')
if virtualenv:
	activate_this = os.path.join(virtualenv, 'bin', 'activate_this.py')
	if os.path.exists(activate_this):
		execfile(activate_this, dict(__file__=activate_this))
EOF


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
 set backspace=indent,eol,start

" HTML (tab width 2 chr, no wrapping)
autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2
autocmd FileType html set textwidth=0
" XHTML (tab width 2 chr, no wrapping)
autocmd FileType xhtml set sw=2
autocmd FileType xhtml set ts=2
autocmd FileType xhtml set sts=2
autocmd FileType xhtml set textwidth=0
" CSS (tab width 2 chr, wrap at 79th char)
autocmd FileType css set sw=2
autocmd FileType css set ts=2
autocmd FileType css set sts=2

" Autocomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
