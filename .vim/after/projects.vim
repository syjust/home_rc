" only php projects for the moment
let g:vim_projects = [
  \ {
    \ 'path' : $HOME.'/origin/data/COMMON/www/rest-billing',
    \ 'excludes' : [ 'lib/SMPP', 'lib/sftp', 'lib/html2pdf' ]
  \ } ,
  \ { 'path' : $HOME.'/origin/data/COMMON/www/notification' },
  \ { 'path' : $HOME.'/origin/data/COMMON/www/billing-manager' }
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
    endif
  endfor
endif
