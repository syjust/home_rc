"""""""""""""""""""""""
" Vedbug xdebug tests "
"""""""""""""""""""""""
" :help Vdebug
call pathogen#helptags()

" add ?XDEBUG_SESSION_START=1 in your get URL to connect Browser to vim debug
" Once in debugging mode, the following default mappings are available:
" <F5>: start/run (to next breakpoint/end of script)
" <F2>: step over
" <F3>: step into
" <F4>: step out
" <F6>: stop debugging (kills script)
" <F7>: detach script from debugger
" <F9>: run to cursor
" <F10>: toggle line breakpoint
" <F11>: show context variables (e.g. after 'eval')
" <F12>: evaluate variable under cursor
" :Breakpoint <type> <args>: set a breakpoint of any type (see :help VdebugBreakpoints)
" :VdebugEval <code>: evaluate some code and display the result
" <Leader>e: evaluate the expression under visual highlight and display the result
" To stop debugging, press <F6>. Press it again to close the debugger interface.

":VdebugOpt debug_file ~/vdebug.log
":VdebugOpt debug_file_level 2

" default options
let g:vdebug_options= {
\    "port" : 9000,
\    "server" : '',
\    "timeout" : 20,
\    "on_close" : 'detach',
\    "break_on_open" : 1,
\    "ide_key" : '',
\    "path_maps" : {},
\    "debug_window_level" : 0,
\    "debug_file_level" : 0,
\    "debug_file" : "",
\    "watch_window_style" : 'expanded',
\    "marker_default" : '⬦',
\    "marker_closed_tree" : '▸',
\    "marker_open_tree" : '▾'
\}
let g:vdebug_options["break_on_open"] = 0
let g:vdebug_options["watch_window_style"] = 'compact' 
let g:vdebug_options["timeout"] = 30

" default keymap
let g:vdebug_keymap = {
\    "run" : "<F5>",
\    "run_to_cursor" : "<F9>",
\    "step_over" : "<F2>",
\    "step_into" : "<F3>",
\    "step_out" : "<F4>",
\    "close" : "<F6>",
\    "detach" : "<F7>",
\    "set_breakpoint" : "<F10>",
\    "get_context" : "<F11>",
\    "eval_under_cursor" : "<F12>",
\    "eval_visual" : "<Leader>e",
\}

""""""""""""""
" Vedbug EOL "
""""""""""""""
