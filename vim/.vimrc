set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'conormcd/matchindent.vim'
Plugin 'yegappan/mru'
Plugin 'dense-analysis/ale'
Plugin 'davidhalter/jedi-vim'
Plugin 'sainnhe/sonokai'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-ruby/vim-ruby'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Indentation settings
set smartindent
set shiftwidth=2 tabstop=2 expandtab

" Fold code
set fdm=indent
set foldnestmax=1

" Wildmenu adds a visualizer for tab completions
set wildmenu
set ignorecase
set smartcase
set backspace=indent,eol,start
set number

" Appearance
set t_Co=256
colorscheme sonokai

" 80 column line highlight
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
filetype indent plugin on
syntax on

" Status line
set laststatus=2

" Tab navigation
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

" Nerdtree plugin
let g:NERDTreeDirArrows=0
map <C-y> :NERDTreeToggle<CR>

" Airline
let g:airline#extensions#ale#enabled = 1

" ALE
let g:ale_completion_enabled = 1

" Jedi
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#show_call_signatures = "2"

" CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
