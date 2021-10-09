set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mboughaba/i3config.vim'
Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'
Plugin 'arcticicestudio/nord-vim'
Plugin 'cocopon/iceberg.vim'
Plugin 'JuliaEditorSupport/julia-vim'

call vundle#end()

colorscheme monokai

" Automatic latex substitutions for julia
let g:latex_to_unicode_auto = 1

hi Normal guibg=NONE ctermbg=NONE

filetype plugin indent on
syntax on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

set et
set sw=4
set smarttab

set number relativenumber

" enable yanking/pasting between terminals
" needs +clipboard, check using vim --version | grep clipboard
" if not, install gvim 
set clipboard=unnamedplus

"i3 config syntax highlighting
aug i3config_ft_detection
au!
au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

"enable autocompletion
set wildmode=longest,list,full

set foldmethod=manual

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-u>"
let g:UltiSnipsJumpBackwardTrigger="<c-i>"
let g:UltiSnipsSnippetDirectories = ["/home/sofia/UltiSnips"]

let g:UltiSnipsEditSplit="vertical"

" Highlight searching
set incsearch
set showmatch
set hlsearch
" set ignorecase
set smartcase

let g:latex_view_general_viewer = "zathura"
let g:vimtex_view_method = "zathura"
let g:tex_flavor = "latex"
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 2
let g:vimtex_compiler_method = "latexmk"
" set conceallevel=1
" let g:tex_conceal='abdmg'
let g:vimtex_quickfix_open_on_warning = 0
" let g:vimtex_quickfix_latexlog = {'default' : 0}
" let g:vimtex_quickfix_latexlog = {
"          \ 'overfull' : 0,
"          \ 'underfull' : 0,
"          \ 'packages' : {
"          \   'default' : 0,
"          \ },
"          \}
let g:Tex_IgnoredWarnings = 
    \'Underfull'."\n".
    \'Overfull'."\n".
    \'specifier changed to'."\n".
    \'You have requested'."\n".
    \'Missing number, treated as zero.'."\n".
    \'There were undefined references'."\n".
    \'Citation %.%# undefined'."\n".
    \'Double space found.'."\n"
let g:Tex_IgnoreLevel = 8

"move between splits
nnoremap <C-U> <C-W><C-J>
nnoremap <C-I> <C-W><C-K>
nnoremap <C-O> <C-W><C-L>
nnoremap <C-Y> <C-W><C-H>

"split down and to the right
set splitbelow splitright

"inoremap <Space><Space> <Esc>/<++><Enter>"_c4l 

"automatically run shortcuts script after saving folders or configs
autocmd BufWritePost ~/Documents/folders,~/Documents/configs !bash shortcuts

map <leader>i :setlocal spell! spelllang=en_us<CR>
map <leader>o :setlocal spell! spelllang=es<CR>
map <leader>p :setlocal spell! spelllang=ru<CR>
map <leader>f :NERDTreeToggle<CR>

inoremap <C-n> <c-g>u<Esc>[s1z=`]a<c-g>u

" Insert newline without entering insert mode
nmap <C-i> O<Esc>j
nmap <C-o> o<Esc>k

" Clear search highlight
nnoremap tt :noh<cr>

hi Normal guibg=NONE ctermbg=NONE

set encoding=utf-8
set fileencoding=utf-8

" Save and restore manual folds when we exit a file
"augroup SaveManualFolds
"    autocmd!
"    au BufWrite,VimLeave ?* silent! mkview
"    au BufRead           ?* silent! loadview
"augroup END
