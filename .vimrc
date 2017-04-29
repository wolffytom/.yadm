" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
" set textwidth=120
" turn syntax highlighting on
set t_Co=256
syntax on
" colorscheme wombat256
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
filetype plugin on

"""""""""""""Vundle"""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'valloric/youcompleteme'
let g:ycm_python_binary_path = 'python'
highlight YcmErrorLine guibg=#3f0000
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_goto_buffer_command = 'horizontal-split'
map <C-b> :YcmCompleter GoTo<CR><CR>
let g:ycm_autoclose_preview_window_after_insertion = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'
" incsearch.vim x fuzzy x vim-easymotion
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin 'bling/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"set laststatus=2
"let g:airline#extensions#tabline#enabled = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin 'suan/vim-instant-markdown'
""""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#end()            " required
filetype plugin indent on    " required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""shortcut
map <f5> :call Clang()<CR>
func! Clang()
    exec "w"  
    exec "!clear && clang++ -std=c++11 % -o %<"  
    exec "! ./%<"  
endfunc 
