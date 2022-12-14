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
Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'
call plug#end()

colorscheme everforest

syntax on
syntax enable
filetype plugin indent on

" Airline
let g:airline_powerline_fonts = 1
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
set nowrap 				" Overflow scroll
set smartindent
set tabstop=4
set shiftwidth=4
set lbr					" Linebreak
autocmd BufNewFile,BufRead *.txt,*.tex,*.md setlocal spell spelllang=en_us " Set locale for spell check on tex and txt files
set nojoinspaces
set clipboard=unnamed,unnamedplus   " Connect to clipboard
set backspace=2                     " either the clipboard or the version of vim breaks backspace, this fixes it

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


