let php_folding=0

" big title php coment with '\'
map \ A //yyPv$r/yyjpklll

map <leader>n <Esc>:EnableFastPHPFolds<Cr>

" specific php indents
set shiftwidth=4
set softtabstop=4
set tabstop=4

"""""""""""""""
" PHPCOMPLETE "
"""""""""""""""
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

"""""""""
" PHPQA "
"""""""""
let g:phpqa_php_cmd='/usr/bin/php'
" phpmd come from https://phpmd.org/download/index.html || https://github.com/phpmd/phpmd
let g:phpqa_messdetector_cmd=$HOME."/.bin/phpmd"
" codesniffer (not already implemented in my home_rc env)
" let g:phpqa_codesniffer_cmd='/path/to/phpcs'
" come from https://github.com/phpmd/phpmd/blob/master/src/main/resources/rulesets/unusedcode.xml and modified locally
let g:phpqa_messdetector_ruleset=$HOME."/.vim/ftplugin/php/rulesets/unusedcode.xml"
" no autorun : serious latency problem
let g:phpqa_messdetector_autorun=1
let g:phpqa_codesniffer_autorun=0
let g:phpqa_codecoverage_autorun=0
let g:phpqa_run_on_write=0
map <leader>m :Phpmd<cr>

" php doc block (pdv) template snip dir (<C-p>)
let g:pdv_template_dir = $HOME."/.vim/bundle/pdv/templates_snip"
nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>

" phpunit Test from list of methods basing on ClassTest name
map <leader>c :s#\(.*\)#\="    /**\r     * test".substitute(submatch(1), '\(.*\)', '\u\1', 'g')."\r     * @cover ".substitute(expand('%:t'), 'Test.php', '', 'g')."::".submatch(1)."()\r     * @author ".pdv_author."\r     * @date ".strftime('%Y-%m-%d')."\r     * @todo implement test : test".substitute(submatch(1), '\(.*\)', '\u\1', 'g')."()\r     */\r    public function test".substitute(submatch(1), '\(.*\)', '\u\1', 'g')."()\r    {\r        $this->markTestIncomplete('test ".substitute(expand('%:t'), 'Test.php', '', 'g')."::".submatch(1)."() here');\r    }\r"#<cr>

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

" ctags Tlist PHP kinds
" +cidf-v :
" +c  classes 
" +i  interfaces 
" +d  constant definitions 
" +f  functions 
" -v  variables 
" -j  javascript functions 

"let g:ctags_common_args .= "--languages=PHP "
"let g:ctags_common_args .= "-f ~/ramfs/rest-billing.php.tags "
"let g:ctags_common_args .= "--exclude=/home/sjust/origin/data/COMMON/www/rest-billing/lib/SMPP "
"let g:ctags_common_args .= "--exclude=/home/sjust/origin/data/COMMON/www/rest-billing/lib/sftp "
"let g:ctags_common_args .= "--exclude=/home/sjust/origin/data/COMMON/www/rest-billing/lib/html2pdf "
"let g:ctags_common_args .= "--exclude=/home/sjust/origin/data/COMMON/www/rest-billing/lib/DB/DBWrapper.class.php "
let g:ctags_common_args  = "-R --php-kinds=+cidf-vj "
let g:ctags_common_args .= "--regex-PHP=\"/^(\\s*([A-Z_]+)\\s*=\\s*([0-9]+|[tT][rR][uU][eE]|[fF][aA][lL][sS][Ee]|[_A-Z]+|['\\\"][^'\\\"]+['\\\"])\\s*[,;]?)/\\2/d/\" "
let g:ctags_common_args .= "--regex-PHP='/abstract\\s+class\\s+([^\\s]+)/\\1/c/' "
let g:ctags_common_args .= "--regex-PHP='/interface\\s+([^\\s]+)/\\1/c/' "
let g:ctags_common_args .= "--regex-PHP='/((public|static|protected|private|final)\\s+)+\\$([^\\s=]+)/\\3/p/' "
let g:ctags_common_args .= "--regex-PHP='/const\\s+([^\\s=]+)/\\1/d/' "
let g:ctags_common_args .= "--regex-PHP='/\\s*((public|static|protected|private|final|abstract)\\s+)?((public|static|protected|private|final|abstract)\\s+)?((public|static|protected|private|final|abstract)\\s+)function\\s+([^\\(]\\+)\\s*\\([^\\)]*\\)/\\7/f/' "
let g:ctags_common_args .= "--regex-PHP='/[[:blank:]]*((public|static|protected|private|final|abstract)[[:blank:]]+){1,3}function[[:blank:]]+([^\\(]+)[[:blank:]]*\\([^\\)]*\\)/\\3/f/e' "

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
    \        "files" : g:php_project_path,
    \        "createAnyWhere" : 1
    \    }
    \}
    " static .tags declaration because tagfile seem's don't work fine
    " <C-f> : find all occurence under cursor fro type php excluding
    " overwrite <C-f> for PHP env
    " @todo get ignore form project.vim
    nnoremap <C-f> ye:copen<CR>:Ack --type=php --ignore-file=is:.php.tags --ignore-dir=.git --ignore-dir=lib/html2pdf --ignore-dir=lib/Zend --ignore-dir=lib/sftp <C-f>p<CR>
endif
