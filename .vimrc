set nocompatible
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

if exists('*minpac#init')
  call minpac#init()
  "Tools
  call minpac#add('k-takata/minpac', {'type': 'opt'})
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('bling/vim-airline')
  call minpac#add('tpope/vim-surround')
  call minpac#add('janko-m/vim-test')
  call minpac#add('benmills/vimux')
  call minpac#add('prabirshrestha/async.vim')
  call minpac#add('prabirshrestha/asyncomplete.vim')
  call minpac#add('prabirshrestha/asyncomplete-buffer.vim')
  call minpac#add('tpope/vim-obsession')
  call minpac#add('jeffkreeftmeijer/vim-numbertoggle')
  call minpac#add('tpope/vim-endwise')

  "Lookup files
  call minpac#add('mhinz/vim-grepper')
  call minpac#add('ctrlpvim/ctrlp.vim')

  "Git
  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('tpope/vim-fugitive')

  "Language Packages
  call minpac#add('elixir-lang/vim-elixir')
  call minpac#add('slashmili/alchemist.vim')
  call minpac#add('rust-lang/rust.vim')
  call minpac#add('racer-rust/vim-racer')
  call minpac#add('keremc/asyncomplete-racer.vim')
  call minpac#add('tpope/vim-scriptease')
  call minpac#add('pangloss/vim-javascript')
endif


" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

if filereadable(expand('<sfile>:p:h') . '/pack/themes/start/dracula/README.md')
  packadd! dracula
  colorscheme dracula
endif

syntax on
filetype plugin indent on
set encoding=utf-8 

"make cursor stay put when switching buffers
set nostartofline

set autoindent
set number
set scrolloff=5
language en_US.UTF-8

"Search while typing
set incsearch

"Search case insensitive
set ignorecase

"Highlight search terms
set hlsearch

"command-line completion operates in an enhanced mode
set wildmenu

"opening a new file when the current buffer has unsaved changes causes files to be hidden instead of closed
set hidden

"make the backspace works
set backspace=indent,eol,start

"make current line bold
set cursorline
highlight   CursorLine    term=NONE    cterm=bold

" Highlight matching parens, brackets, etc. (like emacs)
set showmatch


"Restore cursor to file position in previous editing session
""http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
"set viminfo='10,\"100,:20,%,n~/.viminfo
" :help last-position-jump
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


""""""""" MAPPINGS
"a hint for prabirshrestha/asyncomplete.vim to close autocomplete popup
inoremap <expr> <C-y> pumvisible() ? asyncomplete#close_popup() : "\<C-y>"

"map jj to go to normal mode
inoremap jj <Esc>

"Clear search highlight
nnoremap <C-l> :nohlsearch<CR>

"Kill the opened buffer
nnoremap <C-k> :bd<CR>

"Break the line from cursor
nnoremap <C-j> i<CR><Esc>

"Jump to home in Vim's command line
cnoremap <C-a>  <Home>

"vimrc config helpers
nnoremap <Leader>e :e ~/.vimrc<CR>
nnoremap <Leader>r :source ~/.vimrc<CR>


"Switch between last buffers
nnoremap <C-\> :e #<CR>

"<UP> goes through the history where starts with text
cnoremap <C-p>  <UP>

"Delete to end of command line in Vim
cnoremap <C-k> <C-\>e(strpart(getcmdline(), 0, getcmdpos() - 1))<CR>

silent execute '!mkdir -p /tmp/vim-stuff'
set backupdir=/tmp/vim-stuff//
set directory=/tmp/vim-stuff//
set undodir=/tmp/vim-stuff//

""""""""" PLUGIN MAPPINGS

"Grep for current word in git
noremap <c-g> :Grepper -cword -noprompt<CR>

"GitStatus
noremap <Leader>g :Gstatus<CR>

"Run test
nnoremap <Leader>t :TestNearest<CR>

"Open Buffer list of CtrlP
map <Leader>b :CtrlPBuffer<CR>


""""""""" PLUGIN CONFS

au User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'alchemist',
    \ 'whitelist': ['elixir'],
    \ 'completor': function('asyncomplete#sources#elixir#completor'),
    \ 'config': { },
    \ })

let g:ctrlp_user_command = 'rg --files'

let g:grepper = {}
let g:grepper.tools = ['git', 'rg']

let test#strategy = 'vimux'

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#racer#get_source_options({'config': {} }))
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap K <Plug>(rust-doc)


autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'allowlist': ['*'],
    \ 'blocklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \    'max_buffer_size': 5000000,
    \  },
    \ }))

"""""""""""" Elixir Format
autocmd BufWritePost *.exs silent :!mix format %
autocmd BufWritePost *.ex silent :!mix format %

"""""""""""" JS indention
"autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab
