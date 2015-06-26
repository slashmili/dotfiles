set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'


filetype on
filetype plugin on
filetype indent on
syntax on


set laststatus=2

set autoindent
set incsearch
set nohlsearch
set fdm=marker
set hlsearch
set wildmenu
set ignorecase
set hidden
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set number
set scrolloff=5

"Restore cursor to file position in previous editing session
""http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
set viminfo='10,\"100,:20,%,n~/.viminfo

Plugin 'kien/ctrlp.vim'
map <Leader>t :CtrlPBuffer<CR>
let g:ctrlp_map = '<C-t>'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v\c\.(git|svn)$',
    \ 'file': '\v\c\.(swf|bak|png|gif|js|mov|ico|jpg|pdf|jrxml)$',
    \}

   
Plugin 'ntpeters/vim-better-whitespace'
ToggleWhitespace
nmap <silent> <Leader><space> :StripWhitespace<CR>



colorscheme colorfulnight
set cursorline
highlight   CursorLine    term=NONE    cterm=bold ctermbg=darkgray
set cursorcolumn


" :help last-position-jump
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"Clear search highlight
nmap <C-l> :nohlsearch<CR>   

"map jj to go to normal mode
imap jj <Esc>


"Kill the opened buffer
nmap <C-k> :bd<CR>
