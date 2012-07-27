" ref-vim 英辞郎設a
let g:ref_alc_cmd='w3m %s'
" 表示する行数
let g:ref_alc_start_linenumber=38 
let g:ref_open="vsplit"

" ref-perldoc
command! -nargs=1 -complete=customlist,ref-complete Perldoc call ref#open('perldoc', '<args>')
