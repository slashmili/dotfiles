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
Plugin 'kien/ctrlp.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-fugitive'
Plugin 'hhvm/vim-hack'
Plugin 'vim-ruby/vim-ruby'
Plugin 'joonty/vdebug'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'avakhov/vim-yaml'
Plugin 'elixir-lang/vim-elixir'
Plugin 'terryma/vim-multiple-cursors'

call vundle#end()
filetype on
filetype plugin on
filetype indent on
syntax on


set laststatus=2

set nocompatible
se nostartofline
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
set backspace=indent,eol,start

"Restore cursor to file position in previous editing session
""http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
"set viminfo='10,\"100,:20,%,n~/.viminfo
" :help last-position-jump
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


map <Leader>t :CtrlPBuffer<CR>
let g:ctrlp_map = '<C-t>'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v\c(node_modules|_build|priv|deps|vendor|\.git|\.svn)$',
    \ 'file': '\v\c\.(swf|bak|png|gif|mov|ico|jpg|pdf|jrxml)$',
    \}


colorscheme colorfulnight
set cursorline
highlight   CursorLine    term=NONE    cterm=bold ctermbg=darkgray
set cursorcolumn


" :help last-position-jump
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" set 2 space tab for ruby file
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" to open quickfix window after running Ggrep
autocmd QuickFixCmdPost *grep* cwindow

"Clear search highlight
nmap <C-l> :nohlsearch<CR>

"map jj to go to normal mode
imap jj <Esc>

"Kill the opened buffer
nmap <C-k> :bd<CR>

"Toggle spell checker
nnoremap <leader>s :set spell!<CR>

"Clean whitespace at the end of the lines
nmap <silent> <Leader><space> :StripWhitespace<CR>


"Git Grep shorthand
func GitGrep(...)
    let save = &grepprg
    set grepprg=git\ grep\ -n\ $*
    let s = 'grep'
    for i in a:000
        let s = s . ' ' . i
    endfor
    exe s
    let &grepprg = save
endfun
command -nargs=? G call GitGrep(<f-args>)
