filetype on
filetype plugin on
filetype indent on
syntax on


set statusline=%F%m%r%h%w\ [%{&ff}]\ %y\ [Line=%04l,CHR=%03c(%03v)]\ [%p%%]\ [LEN=%L]
set laststatus=2 " Enables the status line at the bottom of Vim

set nocompatible
set autoindent
set incsearch
set nohlsearch
set fdm=marker
set viminfo='10,\"100,:20,%,n~/.viminfo
set hlsearch
set wildmenu
set ignorecase


"http://www.vim.org/scripts/script.php?script_id=95 : A windows style
map <F2> :WMToggle<CR>

"http://www.vim.org/scripts/script.php?script_id=273 : taglist
let Tlist_Inc_Winwidth = 0
map <F3> :Tlist<CR>

vmap <F7> "*y
map <S-F7> :r!xclip -o<CR>

map <C-o> :FufCoverageFile<CR>
map <S-M-Right> :tabnext<CR>
map <S-M-Left> :tabprevious<CR>
