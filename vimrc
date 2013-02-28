"vundle start
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"bundle start

Bundle 'gmarik/vundle'
"Bundle 'ervandew/supertab'
"Bundle 'Rip-Rip/clang_complete'
Bundle 'msanders/snipmate.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'vim-scripts/Colour-Sampler-Pack'
Bundle 'vim-scripts/ScrollColors'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/STL-improved'
"Bundle 'badgeek/vim-clang'
"Bundle 'https://gist.github.com/badgeek/5056840/raw/4fdc3543f1b49bca0370e74dd109e5b1cd291264/dash.vim'
Bundle 'Valloric/YouCompleteMe'


"bundle stop

filetype plugin indent on     " required!
"vundle stop


if has('mouse')
	set mouse=a
    if &term =~ "xterm" || &term =~ "screen"
        autocmd VimEnter * set ttymouse=xterm2
        autocmd FocusGained * set ttymouse=xterm2
        autocmd BufEnter * set ttymouse=xterm2
    endif
endif

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


function! ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere = 1

    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    "let tagbar_open = bufwinnr('__Tagbar__') != -1

    " Perform the appropriate action
    if nerdtree_open 
        NERDTreeClose
        "TagbarClose
    elseif nerdtree_open
        "TagbarOpen
    else
        NERDTree
        "TagbarOpen
    endif

    " Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction

function! s:dash(...)
  let ft = &filetype
  if &filetype == 'python'
    let ft = ft.'2'
  endif
  let ft = ft.':'
  let word = len(a:000) == 0 ? input('Dash search: ', ft.expand('<cword>')) : ft.join(a:000, ' ')
  "let word = len(a:000) == 0 ? input('Dash search: ', ft.join(a:000, ' ')
  call system(printf("open dash://'%s'", word))
endfunction
command! -nargs=* Dash call <SID>dash(<f-args>)


" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

"appearance, etc on gui macvim
let g:Powerline_symbols = 'fancy'
if has("gui_running")
	set guifont=Inconsolata:h14
	"set guifont=Inconsolata-dz\ for\ Powerline:h12
	"always hide the toolbar icons
	set guioptions-=T
	"always hide the scrollbars
	"set guioptions-=L
	"set guioptions-=l
	"set guioptions-=R
	"set guioptions-=r
endif


"appearance, etc
"set guifont=Inconsolata-dz\ \ for\ Powerline\ 14
colorscheme rootwater
set number
syntax on
set ts=4
hi Pmenu ctermbg=0xFF00FF
"sound no annoying "ding" sound
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
" power line
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
"Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
"Limit popup menu height
set pumheight=15


"easy split window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"tun off arrow hehe
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>

"open file or buffer
nmap <leader>fo :FufFileWithCurrentBufferDir<CR>
nmap <leader>fd :FufDirWithCurrentBufferDir<CR>
nmap <leader>fb :CommandTBuffer<CR>

"switch buffer 
noremap <C-left> :bprev<CR>
noremap <C-right> :bnext<CR> 

nmap <leader>\ :call ToggleNERDTreeAndTagbar()<CR>
nmap <leader>t :TagbarToggle<CR> 

" OSX - backspace fix
set backspace=indent,eol,start

" PYTHON
autocmd filetype python source ~/.vim/ftplugin/python/python_pydoc.vim
autocmd filetype python source ~/.vim/ftplugin/python/vim-ipython.vim
autocmd filetype python colorscheme jellybeans

" PHP
autocmd FileType php colorscheme calmar256-dark

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


" CLANG_COMPLETE

"let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'
"let g:clang_user_options='|| exit 0'
"let g:clang_complete_auto = 0
"let g:clang_complete_copen = 1
"let g:clang_use_library = 1
"let g:clang_library_path="/Users/xcorex/Library/Application Support/Sublime Text 2/Packages/SublimeClang/"
"let g:clang_trailing_placeholder = 1
"let g:clang_snippets=1
"let g:clang_conceal_snippets=1
"let g:clang_snippets_engine='snipmate'
"let g:clang_complete_macros=1

" C++ SYNTAX
"hi cCustomFunc  gui=bold guifg=yellowgreen
"hi cCustomClass gui=reverse guifg=#CCCCCC
"
"
"
let g:clang_exec="arch -i386 /Developer/usr/bin/clang"
let g:clang_cpp_options="-fcxx-exceptions -fexceptions"
let g:clang_diags=""
