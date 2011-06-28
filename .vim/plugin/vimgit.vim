" NOTE: You must, of course, just call this function 
"       in git repository.

func GitGrep(...)
  let save = &grepprg
  set grepprg=git\ grep\ -n\ $*
  let s = 'grep'
  for i in a:000
    let s = s . ' ' . i
  endfor
  exe "silent! ". s
  botright copen
  let &grepprg = save
   exec "redraw!"
endfun
command -nargs=? G call GitGrep(<f-args>)


func GitGrepWord()
    normal! "zyiw
        call GitGrep('-w -e ', getreg('z'))
    endf
nmap <C-x>G :call GitGrepWord()<CR>
