"vundle start
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"bundle start

Bundle 'gmarik/vundle'
Bundle 'ervandew/supertab'
"Bundle 'Rip-Rip/clang_complete'
Bundle 'msanders/snipmate.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'vim-scripts/Colour-Sampler-Pack'
"Bundle 'vim-scripts/ScrollColors'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/STL-improved'
Bundle 'badgeek/vim-clang'
Bundle 'scrooloose/syntastic'
Bundle 'mbadran/headlights'
Bundle 'twe4ked/vim-peepopen'
Bundle 'majutsushi/tagbar'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'scrooloose/nerdtree'
"Bundle 'https://gist.github.com/badgeek/5056840/raw/4fdc3543f1b49bca0370e74dd109e5b1cd291264/dash.vim'
"Bundle 'Valloric/YouCompleteMe'


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
" au BufWritePost .vimrc so ~/.vimrc
" https://gist.github.com/nocash/1988620
augroup AutoReloadVimRC
	au!
	" automatically reload vimrc when it's saved
	au BufWritePost $MYVIMRC so $MYVIMRC
augroup END


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

"Text editors on Mac OS X lets the user hold down shift+movement key to extend the selection. Also, pressing a printable key whilst selecting replaces the current selection with that character.
"http://stackoverflow.com/questions/2129723/using-shiftarrows-to-select-text-in-vim-macvim
if has("gui_macvim")
    let macvim_hig_shift_movement = 1
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

"These two options, when set together, will make /-style searches
"case-sensitive only if there is a capital letter in the search expression.
"*-style searches continue to be consistently case-sensitive.
set ignorecase 
set smartcase

set hlsearch " Highlight search terms...
set incsearch " ...dynamically as they are typed.


" Use jk as <Esc> alternative 
inoremap jk <Esc>

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
nmap <leader>ff :FufFileWithCurrentBufferDir<CR>
nmap <leader>fd :FufDirWithCurrentBufferDir<CR>
nmap <leader>fb :CommandTBuffer<CR>
nmap <leader>\ :call ToggleNERDTreeAndTagbar()<CR>
nmap <leader>t :TagbarToggle<CR> 

"clear highlight search
noremap <silent><Leader>/ :nohls<CR>

"switch buffer 
noremap <C-left> :tabp<CR>
noremap <C-right> :tabn<CR> 

"switch tab
noremap <C-up> :bnext<CR> 
noremap <C-down> :bprev<CR>


" OSX - backspace fix
set backspace=indent,eol,start

" PYTHON
"autocmd filetype python source ~/.vim/ftplugin/python/python_pydoc.vim
"autocmd filetype python source ~/.vim/ftplugin/python/vim-ipython.vim
"autocmd filetype python colorscheme jellybeans

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
"let g:clang_library_path="/Users/xcorex/ycm_build/llvm_root_dir/lib/"
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


let g:syntastic_cpp_include_dirs = ['/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/openFrameworks', '/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/openFrameworks/3d', '/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/openFrameworks/app', '/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/openFrameworks/communication', '/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/openFrameworks/events', '/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/openFrameworks/gl', '/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/openFrameworks/graphics', '/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/openFrameworks/math', '/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/openFrameworks/sound', '/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/openFrameworks/types', '/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/openFrameworks/utils', '/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/openFrameworks/video', '/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/assimp/include','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/assimp/include/Compiler','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/cairo/include','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/cairo/include/cairo','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/cairo/include/libpng15','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/cairo/include/pixman-1','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/fmodex/include','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/FreeImage/include','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/freetype/include','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/freetype/include/freetype2','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/freetype/include/freetype2/freetype','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/freetype/include/freetype2/freetype/config','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/freetype/include/freetype2/freetype/internal','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/freetype/include/freetype2/freetype/internal/services','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/glew/include','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/glew/include/GL','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/glut/include','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/poco/include','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/poco/include/CppUnit','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/poco/include/Poco','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/poco/include/Poco/Crypto','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/poco/include/Poco/Data','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/poco/include/Poco/DOM','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/poco/include/Poco/Dynamic','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/poco/include/Poco/Net','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/poco/include/Poco/SAX','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/poco/include/Poco/Util','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/poco/include/Poco/XML','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/poco/include/Poco/Zip','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/rtAudio/include','/Users/xcorex/Documents/Documents/Projects/OpenFrameworks/of_v0.7.4_osx_release/apps/projects/cameraBuffer/../../../libs/tess2/include' ]
let g:syntastic_cpp_check_header = 0
let g:syntastic_cpp_no_include_search = 0
let g:syntastic_check_on_open= 0
let g:syntastic_enable_balloons = 1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby', 'php'], 'passive_filetypes': ['puppet'] }

