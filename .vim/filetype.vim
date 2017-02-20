" syntax for special filetypes
autocmd BufNewFile,BufRead *.conf setfiletype gitconfig
autocmd BufNewFile,BufRead ~/{dev,prod,stag}-tmp/syl/{1,2,3,4,5,6,7,8,9} setfiletype sql
autocmd BufNewFile,BufRead *.screenrc setfiletype screen

