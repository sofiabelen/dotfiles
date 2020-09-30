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
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdtree'
Plugin 'crusoexia/vim-dracula'
Plugin 'arcticicestudio/nord-vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'chriskempson/base16-vim'

call vundle#end()

colorscheme nord

" let g:dracula_italic = 0
" colorscheme dracula

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

"lightline configs
"let g:lightline = {'colorscheme':'wombat'}
"set laststatus=2
"set noshowmode

"i3 config syntax highlighting
aug i3config_ft_detection
au!
au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

"enable autocompletion
set wildmode=longest,list,full

" Enable folding according to syntax
set foldmethod=syntax

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
"set conceallevel=1
"let g:tex_conceal='abdmg'
let g:vimtex_quickfix_latexlog = {'default' : 0}
let g:vimtex_quickfix_latexlog = {
         \ 'overfull' : 0,
         \ 'underfull' : 0,
         \ 'packages' : {
         \   'default' : 0,
         \ },
         \}
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

" Copyright 2019 Google LLC
"
" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at
"
"    https://www.apache.org/licenses/LICENSE-2.0
"
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.

" Indent Python in the Google way.
" 
" setlocal indentexpr=GetGooglePythonIndent(v:lnum)
" 
" let s:maxoff = 50 " maximum number of lines to look backwards.
" 
" function GetGooglePythonIndent(lnum)
" 
"   " Indent inside parens.
"   " Align with the open paren unless it is at the end of the line.
"   " E.g.
"   "   open_paren_not_at_EOL(100,
"   "                         (200,
"   "                          300),
"   "                         400)
"   "   open_paren_at_EOL(
"   "       100, 200, 300, 400)
"   call cursor(a:lnum, 1)
"   let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
"         \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
"         \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
"         \ . " =~ '\\(Comment\\|String\\)$'")
"   if par_line > 0
"     call cursor(par_line, 1)
"     if par_col != col("$") - 1
"       return par_col
"     endif
"   endif
" 
"   " Delegate the rest to the original function.
"   return GetPythonIndent(a:lnum)
" 
" endfunction
" 
" let pyindent_nested_paren="&sw*2"
" let pyindent_open_paren="&sw*2"

" Python inside latex, never worked too well
" function! PythonTexCompile()
"     silent !clear
"     call vimtex#compiler#compile_ss()
"     execute '!pythontex' fnameescape(b:vimtex.tex)
"     call vimtex#compiler#compile_ss()
" endfunction
" nnoremap <C-p> :call PythonTexCompile() <CR>

hi Normal guibg=NONE ctermbg=NONE
