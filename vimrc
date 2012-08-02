set nocompatible               " be iMproved
filetype off                   " required!

set guifont=Inconsolata-dz\ \ for\ Powerline\ 14

if has('mouse')
           set mouse=a
             if &term =~ "xterm" || &term =~ "screen"
                         autocmd VimEnter * set ttymouse=xterm2
                         autocmd FocusGained * set ttymouse=xterm2
                         autocmd BufEnter * set ttymouse=xterm2
             endif
endif

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
Bundle 'NERDtree'
Bundle 'Syntastic'
Bundle 'ervandew/supertab'
"Bundle 'pydoc'
Bundle 'ZoomWin'

"from git repo
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
"Bundle 'hallettj/jslint.vim.git'
"Bundle 'joestelmach/lint.vim.git'
Bundle "fs111/pydoc"

let d8_command = '/usr/local/bin/v8'

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
    # pythonpath for module
    os.environ['PYTHONPATH'] = os.path.join(project_base_dir,'lib/python2.7/site-packages') 
EOF

" color scheme
colorscheme molokai
set number
syntax on
hi Pmenu ctermbg=0xFF00FF

" power line
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
let g:Powerline_symbols = 'fancy'

" osx - backspace fix
set backspace=indent,eol,start

if has("gui_running")
"set guifont=Inconsolata:h14
set guifont=Inconsolata-dz\ for\ Powerline:h12
" always hide the toolbar icons
set guioptions-=T
" always hide the scrollbars
"set guioptions-=L
"set guioptions-=l
"set guioptions-=R
"set guioptions-=r
endif

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
