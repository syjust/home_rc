" Cycle metasyntactic variables
function! s:CycleMetasyntacticVariables(num)
  if type(a:num) != type(0)
    return
  endif

  let vars = ['foo', 'bar', 'baz', 'qux', 'quux', 'corge', 'grault', 'garply', 'waldo', 'fred', 'plugh', 'xyzzy', 'thud']
  let cvar = expand('<cword>')
  let i = index(vars, cvar)

  if (i == -1)
    if (a:num > 0)
      execute "normal! \<C-a>"
    else
      execute "normal! \<C-x>"
    endif

    return
  endif

  let i += a:num

  if (i == -1)
    let i = len(vars) - 1
  elseif (i == len(vars))
    let i = 0
  endif 

  call setreg('w', vars[i])
  normal! "_viw"wp
endfunction

nnoremap <C-a> :call <SID>CycleMetasyntacticVariables(1)<Enter>
nnoremap <C-x> :call <SID>CycleMetasyntacticVariables(-1)<Enter>
