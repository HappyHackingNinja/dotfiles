" ============================================================================
" Vim-plug initialization

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif


" ============================================================================
" Active plugins

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" A tree explor plugin for vim
Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden = 1

" A code-completion engine for vim
let aur_ycm_conf_path = "/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
if filereadable(aur_ycm_conf_path)
    " AUR version
    let g:ycm_server_python_interpreter = "/usr/bin/python2"
    let g:ycm_global_ycm_extra_conf = aur_ycm_conf_path
else
    Plug 'valloric/youcompleteme'
endif

" Go development plugin for vim
Plug 'fatih/vim-go'

" Typescript syntax files for vim
Plug 'leafgarland/typescript-vim'

" Lean & mean status/tabline for vim
Plug 'vim-airline/vim-airline'

" Display tags in a window, ordered by scope
Plug 'majutsushi/tagbar'

" A command-line fuzzy finder
Plug 'junegunn/fzf'

" Precision colorscheme for vim
Plug 'altercation/vim-colors-solarized'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif


" ============================================================================
" General

" Enable filetype plugins
filetype plugin on
filetype indent on


" ============================================================================
" VIM user interface

" Show line numbers
set number

" Always show current position
set ruler

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 


" ============================================================================
" Colors and fonts

" Enable syntax highlighting
syntax enable

try
    colorscheme solarized
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
    set guifont=Fira\ Code:h12
endif

" Set utf8 as standard encoding and en_US as the standard language
let $LANG="en_US.UTF-8"
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
