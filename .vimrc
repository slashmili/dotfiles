filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype on
filetype plugin on
filetype indent on
syntax on

"set statusline=%F%m%r%h%w\ [%{&ff}]\ %y\ [Line=%04l,CHR=%03c(%03v)]\ [%p%%]\ [LEN=%L]
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
set hidden
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
colorscheme slate

"http://www.vim.org/scripts/script.php?script_id=3881
let g:Powerline_symbols = 'fancy'
set t_Co=256


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

"Restore cursor to file position in previous editing session
"http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
set viminfo='10,\"100,:20,%,n~/.viminfo

if has("folding")
  function! UnfoldCur()
    if !&foldenable
      return
    endif
    let cl = line(".")
    if cl <= 1
      return
    endif
    let cf  = foldlevel(cl)
    let uf  = foldlevel(cl - 1)
    let min = (cf > uf ? uf : cf)
    if min
      execute "normal!" min . "zo"
      return 1
    endif
  endfunction
endif

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  if has("folding")
    autocmd BufWinEnter * if ResCur() | call UnfoldCur() | endif
  else
    autocmd BufWinEnter * call ResCur()
  endif
augroup END

"Code Folding
set foldmethod=indent
set foldlevel=99

"Window Splits
"Vertical Split : Ctrl+w + v
"Horizontal Split: Ctrl+w + s
"Close current windows: Ctrl+w + q
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"Task lists
map <leader>td <Plug>TaskList

"Revision History
map <leader>g :GundoToggle<CR>


"Syntax Highlighting and Validation
syntax on                      " syntax highlighing
filetype on                    " try to detect filetypes
filetype plugin indent on      " enable loading indent file for filetype

let g:pyflakes_use_quickfix = 0

"Pep8
let g:pep8_map='<leader>8'

"Tab Completion and Documentation
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview


"File Browser
map <leader>n :NERDTreeToggle<CR>

"Refactoring and Go to definition
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
"Searching
nmap <leader>a <Esc>:Ack!

"Clear search highlight
nmap <C-l> :nohlsearch<CR>
"GIT
"%{fugitive#statusline()}

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

"highlight trailing white space
"http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red
function! <SID>StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nmap <silent> <Leader><space> :call <SID>StripTrailingWhitespace()<CR>

