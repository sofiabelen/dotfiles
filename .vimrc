set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'mboughaba/i3config.vim'
Plugin 'tpope/vim-eunuch'
Plugin 'lervag/vimtex'
Plugin 'vim-syntastic/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'dylanaraps/wal.vim'
Plugin 'junegunn/goyo.vim'

call vundle#end()
colorscheme wal

filetype plugin indent on
syntax on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

"let mapleader = ","

set et
set sw=4
set smarttab
map <f2> :w\|!python %

set number relativenumber

" enable yanking/pasting between terminals
" needs +clipboard, check using vim --version | grep clipboard
" if not, install gvim 
set clipboard=unnamedplus

"lightline configs
"let g:lightline = {'colorscheme':'wombat'}
"set laststatus=2
set noshowmode

"i3 config syntax highlighting
aug i3config_ft_detection
au!
au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

"enable autocompletion
set wildmode=longest,list,full

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
let g:UltiSnipsSnippetDirectories = ["/home/sofia/UltiSnips"]

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Highlight searching
set incsearch
set showmatch
set hlsearch
set ignorecase
set smartcase

let g:latex_view_general_viewer = "zathura"
let g:vimtex_view_method = "zathura"
let g:tex_flavor = "latex"
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 2
let g:vimtex_compiler_method = "latexmk"
set conceallevel=1
let g:tex_conceal='abdmg'

"move between splits
nnoremap <C-U> <C-W><C-J>
nnoremap <C-I> <C-W><C-K>
nnoremap <C-O> <C-W><C-L>
nnoremap <C-Y> <C-W><C-H>

"split down and to the right
set splitbelow splitright

"inoremap <Space><Space> <Esc>/<++><Enter>"_c4l 
