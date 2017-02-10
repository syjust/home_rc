let php_folding=0

" big title php coment with '\'
map \ A //yyPv$r/yyjpklll

" specific php indents
set shiftwidth=4
set softtabstop=4
set tabstop=4

"-------------"
" phpcomplete "
"-------------"
"let g:phpcomplete_active_function_extensions
"let g:phpcomplete_active_class_extensions
"let g:phpcomplete_active_interface_extensions
"let g:phpcomplete_active_constant_extensions
let g:phpcomplete_relax_static_constraint=1 "1/0[default0]
let g:phpcomplete_complete_for_unknown_classes=1 "1/0[default0]
let g:phpcomplete_search_tags_for_variables=1 "1/0[default0]
let g:phpcomplete_min_num_of_chars_for_namespace_completion=1 "[default1]Requirespatchedctags
let g:phpcomplete_parse_docblock_comments=1 "1/0[default0]
let g:phpcomplete_cache_taglists=1 "1/0[default1]
let g:phpcomplete_enhance_jump_to_definition=1 "1/0[default1]

" phpqa
let g:phpqa_messdetector_ruleset=$HOME."/phpmd-ruleset.xml"
let g:phpqa_messdetector_cmd=$HOME."/bin/phpmd"
let g:phpqa_messdetector_autorun=1
let g:phpqa_codesniffer_autorun=0

" php doc block (pdv) template snip dir (<C-p>)
let g:pdv_template_dir = $HOME."/.vim/bundle/pdv/templates_snip"
nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>

" PHP Complete :
" jump_to_def' <C-]>
" jump_to_def_split': <C-w><C-]>
" jump_to_def_vsplit': ???
let g:phpcomplete_mappings = {
\ 'jump_to_def': "'f",
\ 'jump_to_def_split': "'d",
\ 'jump_to_def_vsplit': "'s",
\}

" debug taggatron ctags cmd
"let g:taggatron_verbose=1

" common ctags-args for PHP env
" +cidf-v :
" +c  classes 
" +i  interfaces 
" +d  constant definitions 
" +f  functions 
" -v  variables 
" -j  javascript functions 
if !exists('ctags_common_args')
    let g:ctags_common_args = " --regex-PHP=\"/^(\\s*([A-Z_]+)\\s*=\\s*([0-9]+|[tT][rR][uU][eE]|[fF][aA][lL][sS][Ee]|[_A-Z]+|['\\\"][^'\\\"]+['\\\"])\\s*[,;]?)/\\2/d/\" --regex-PHP='/const\\s+([^ \\t=]+)/\\1/d/' -R --php-kinds=+cidf-vj "
endif

source ~/.vim/after/projects.vim

if exists('php_project_path')
    " phpcomplete tag cmd
    if exists('ctags_ramfs')
      let &tags=g:ctags_ramfs.".php.tags"
    else
      let &tags=g:php_project_path.".php.tags"
    endif
    let g:tagcommands = {
    \    "php" : {
    \        "tagfile" : &tags,
    \        "args" : g:ctags_common_args,
    \        "cmd" : g:Tlist_Ctags_Cmd,
    \        "files" : g:php_project_path
    \    }
    \}
    " static .tags declaration because tagfile seem's don't work fine
    " <C-f> : find all occurence under cursor fro type php excluding
    nnoremap <C-f> ye:copen<CR>:Ack --type=php --ignore-file=is:.php.tags --ignore-dir=.git --ignore-dir=lib/html2pdf --ignore-dir=lib/Zend --ignore-dir=lib/sftp <C-f>p<CR>
endif
