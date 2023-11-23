" Install vim plug:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
set nocompatible 				" Disable vi-compatibility

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'chrisbra/csv.vim'
Plug 'rhysd/vim-grammarous'
Plug 'luochen1990/rainbow'

Plug 'sainnhe/everforest'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'

Plug 'nanotech/jellybeans.vim'
Plug 'Yggdroot/indentLine'
Plug 'kamykn/spelunker.vim'
Plug 'preservim/nerdtree'
call plug#end()

" colorscheme everforest
colorscheme OceanicNext

syntax on
syntax enable
filetype plugin indent on

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 0
let g:airline_theme='dark'

" Performance
set nocursorcolumn
set nocursorline
set ttyfast				" Improves redrawing
set lazyredraw          " Don't update while in macro
syntax sync fromstart

" Display
set equalalways 		" Display split windows equally
set background=dark
set t_Co=256			" Number of colors in terminal
set guioptions-=L 		" Remove left scroll bar
set guioptions-=r 		" Remove right scroll bar
set ruler				" Show line number
set number 				" Line numbers
set laststatus=2 		" Status bar
set showcmd 			" Show commands
set splitbelow          " Split windows below current window

" Text
set autoindent
set encoding=utf-8 		" Necessary to show Unicode glyphs
set expandtab           " Use spaces instead of tab
set wrap 				" Overflow scroll
set linebreak
set smartindent
set tabstop=4
set shiftwidth=4
set lbr					" Linebreak
autocmd BufNewFile,BufRead *.txt,*.tex,*.md setlocal spell spelllang=en_us " Set locale for spell check on tex and txt files
set nojoinspaces
set clipboard=unnamed,unnamedplus   " Connect to clipboard
set backspace=2                     " either the clipboard or the version of vim breaks backspace, this fixes it

" Use Control + s to spell check a word
nnoremap <silent> <C-S>         :norm Zl<CR>
vnoremap <silent> <C-S>         <C-C>:norm Zl<CR>
inoremap <silent> <C-S>         <C-O>:norm Zl<CR>

" Searching
set hlsearch
set incsearch			" Search while typing query
set showmatch

" Search for highlighted text
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Keyboard mappings
let mapleader = ","
imap jk <Esc>
" imap jj <Esc>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Go
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" Rails
au BufRead,BufNewFile *.rb,*.rhtml,*.js,*.html,*.css.less set shiftwidth=2 tabstop=2 smartindent expandtab
augroup myfiletypes
	autocmd FileType ruby,eruby,yaml,rabl set ai sw=2 sts=2 et
augroup END

" Trailing whitespace
function! <SID>StripTrailingWhitespaces()
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business
	%s/\s\+$//e
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l,c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Python
au BufNewFile,BufReadPost *.py setl syntax=python shiftwidth=4 expandtab tw=79

" Markdown
au BufRead,BufNewFile *.md set syntax=markdown

" Terraform
autocmd BufEnter *.tf :setlocal filetype=yaml
autocmd FileType yaml setlocal ts=2 sw=2 expandtab

" Disable Background Color Erase (BCE) so that color schemes
" work properly when Vim is used inside tmux and GNU screen.
set t_ut=
let g:indentLine_char = '|'

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree | wincmd p

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
