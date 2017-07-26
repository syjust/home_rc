" big sql COMENT block with '\'
map \ }O*/<esc>{o/*<esc>
" big sql UNCOMENT block with '"'
map " ?\/\*<cr>dd/\*\/<cr>dd{
set foldmethod=marker
" ctags Tlist SQL kinds
" c  cursors
" d  prototypes [off]
" f  functions
" F  record fields
" l  local variables [off]
" L  block label
" P  packages
" p  procedures
" r  records [off]
" s  subtypes
" t  tables
" T  triggers
" v  variables
" i  indexes
" e  events
" U  publications
" R  services
" D  domains
" V  views
" n  synonyms
" x  MobiLink Table Scripts
" y  MobiLink Conn Scripts
" z MobiLink Properties
let g:ctags_common_args = " --sql-kinds=+fpTvVtiF-cselURDxyz"
" source ~/.vim/after/projects.vim

" SQL syntax rewriter (go to line after keyword)
map <leader>c  :se ic<cr>:s#\<\(FROM\\|WHERE\\|IN\\|AND\\|OR\\|ABORT\\|ACCESS\\|AGGREGATE\\|ALTER\\|ANALYZE\\|AS\\|AUTHORIZATION\\|BEGIN\\|CAST\\|CHECKPOINT\\|CLASS\\|CLOSE\\|CLUSTER\\|COLLATION\\|COMMENT\\|COMMIT\\|CONFIGURATION\\|CONSTRAINTS\\|CONVERSION\\|COPY\\|CREATE\\|DATA\\|DATABASE\\|DEALLOCATE\\|DECLARE\\|DEFAULT\\|DELETE\\|DICTIONARY\\|DISCARD\\|DO\\|DOMAIN\\|DROP\\|END\\|EVENT\\|EXECUTE\\|EXPLAIN\\|EXTENSION\\|FAMILY\\|FETCH\\|FOREIGN\\|FUNCTION\\|GRANT\\|GROUP\\|IMPORT\\|INDEX\\|INSERT\\|INTO\\|LABEL\\|LANGUAGE\\|LARGE\\|LISTEN\\|LOAD\\|LOCK\\|MAPPING\\|MATERIALIZED\\|METHOD\\|MOVE\\|NOTIFY\\|OBJECT\\|OPERATOR\\|OWNED\\|PARSER\\|POLICY\\|PREPARE\\|PREPARED\\|PRIVILEGES\\|REASSIGN\\|REFRESH\\|REINDEX\\|RELEASE\\|RESET\\|REVOKE\\|ROLE\\|ROLLBACK\\|RULE\\|SAVEPOINT\\|SCHEMA\\|SEARCH\\|SECURITY\\|SELECT\\|SEQUENCE\\|SERVER\\|SESSION\\|SET\\|SHOW\\|START\\|SYSTEM\\|TABLE\\|TABLESPACE\\|TEMPLATE\\|TEXT\\|TO\\|TRANSACTION\\|TRANSFORM\\|TRIGGER\\|TRUNCATE\\|TYPE\\|UNLISTEN\\|UPDATE\\|USER\\|VACUUM\\|VALUES\\|VIEW\\|WITH\\|WRAPPER\\|TRUE\\|FALSE\)\>#\r\U\1\r  #g<cr>:se noic<cr>
