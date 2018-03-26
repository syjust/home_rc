" only php projects for the moment
let g:vim_projects = [
  \ {
    \ 'path' : '/var/www/magento',
    \ 'ramfs' : $HOME.'/ramfs/mage',
      \ 'abb' : [
        \ {
          \ 'key' : 'mlog',
          \ 'cmd' : "Mage::log('', null, 'syl.log');"
        \ }
      \ ]
  \ } ,
  \ {
    \ 'path' : $HOME.'/origin/data/COMMON/www/rest-billing-dev',
    \ 'excludes' : [ 'lib/SMPP', 'lib/sftp', 'lib/html2pdf', 'lib/DB/DBWrapper.class.php' ],
    \ 'ramfs' : $HOME.'/ramfs/rest-billing-dev'
  \ } ,
  \ {
    \ 'path' : $HOME.'/origin/data/COMMON/www/rest-billing-rc',
    \ 'excludes' : [ 'lib/SMPP', 'lib/sftp', 'lib/html2pdf', 'lib/DB/DBWrapper.class.php' ],
    \ 'ramfs' : $HOME.'/ramfs/rest-billing-rc'
  \ } ,
  \ { 'path' : $HOME.'/origin/data/COMMON/www/notification', 'ramfs' : $HOME.'/ramfs/notification' },
  \ { 'path' : $HOME.'/origin/data/COMMON/www/billing-manager', 'ramfs' : $HOME.'/ramfs/billing-manager',
      \ 'abb' : [
        \ {
          \ 'key' : 'wed',
          \ 'cmd' : "WE_Debug::vardump($e,'e',__FILE__,__LINE__,__METHOD__,WE_Debug::CONTINUER,false,null,false);"
        \ }
      \ ]
  \ }
\ ]

if exists('vim_projects')
  for cwd in g:vim_projects
    if getcwd() =~ cwd.path
      let g:php_project_path = cwd['path']."/"
      if has_key(cwd,'excludes')
        for exclude in cwd.excludes
          let g:ctags_common_args .= " --exclude=".cwd['path']."/".exclude
        endfor
      endif
      if has_key(cwd,'ramfs')
        let g:ctags_ramfs = cwd.ramfs
      endif
      if has_key(cwd,'abb')
        for m in cwd.abb
          execute "abbreviate " . m.key . " " . m.cmd .""
        endfor
      endif
    endif
  endfor
endif
