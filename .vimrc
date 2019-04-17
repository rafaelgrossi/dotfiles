set nocompatible

" Plugin Session
call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
call plug#end()

" Warp text to FILETYPE
augroup WrapLineInFile
	autocmd!
	autocmd FileType tex setlocal wrap
augroup END

" Latex
filetype plugin on
filetype indent on
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'

" Shortcuts
let mapleader  = "," 
inoremap <silent>jk <ESC>:noh<CR>
map <silent><leader>w :w!<cr>
map <silent><leader>q :q<cr>
map <silent><leader>c ZZ
set pastetoggle=<F3>
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <silent><Enter> :noh<CR>
inoremap {		{}<Left>
inoremap {<CR>	{<CR>}<Esc>O
inoremap {{		{
inoremap {}     {}

" Cursor Settings
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
let &t_SR = "\<esc>]50;CursorShape=2\x7" " Underline in replace mode

" Display Settings

"set termguicolors
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" General Settings
set timeout timeoutlen=5000 ttimeoutlen=100
set laststatus=2
set showmode
set relativenumber
set title
set showcmd
syntax on
set hlsearch
set incsearch
set number
set nowrap
set clipboard=unnamed
set mouse=nicr

" Scrolling
set scrolloff=8  
set sidescrolloff=15
set sidescroll=1

" Editor Settings
set ignorecase
set smartcase
set smartindent
set smarttab
set magic
set bs=indent,eol,start
set tabstop=4
set shiftwidth=4

" Shrugs
filetype indent on


" System Settings
set confirm
set nobackup
set history=500

" Matlab
autocmd BufEnter *.m    compiler mlint

" Skeleton Files
if has("autocmd")
	augroup templates
		autocmd BufNewFile main.* silent! execute '0r ~/.vim/skeletons/skeleton-main.'.expand("<afile>:e")
		autocmd BufNewFile *.* silent! execute '0r ~/.vim/skeletons/skeleton.'.expand("<afile>:e")

		autocmd BufNewFile * silent! %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
	augroup END
endif
