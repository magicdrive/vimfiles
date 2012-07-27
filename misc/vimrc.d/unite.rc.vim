"#----------------------------------------------------------# 
"#                                                          #
"# Unite.vimの設定                                          # 
"#                                                          #
"#----------------------------------------------------------#

"{{{1

" File and Buffer {{{2
" 分割しないでuniteのbufferを表示する
nnoremap <Plug>(mykey)u  :<C-u>Unite -no-split<Plug>my(mykey)

" バッファ一覧
nnoremap <silent> <Plug>(mykey)b  :<C-u>Unite -no-split buffer<CR>
" 最近使用したファイル一覧
nnoremap <silent> <Plug>(mykey)m  :<C-u>Unite -no-split file_mru<CR>
" バッファーと最近使用したファイルの一覧 
nnoremap <silent> <Plug>(mykey)u  :<C-u>Unite -no-split buffer file_mru<CR>
" 現在のバッファのカレントディレクトリからファイル一覧
nnoremap <silent> <Plug>(mykey)d  :<C-u>UniteWithBufferDir -no-split file<CR>
" ファイル一覧
nnoremap <silent> <Plug>(mykey)f  :<C-u>Unite -no-split -buffer-name=files file<CR>
"}}}2

" NeoBundle {{{2
nnoremap <silent> <Plug>(mykey)N  :<C-u>Unite -no-split neobundle<CR>
nnoremap <silent> <Plug>(mykey)nn  :<C-u>Unite -no-split neobundle<CR>
nnoremap <silent> <Plug>(mykey)ns  :<C-u>Unite -no-split neobundle/search<CR>
"}}}2

" Ref {{{2
nnoremap <silent> <Plug>(mykey)rp :<C-u> Unite ref/perldoc<CR>
nnoremap <silent> <Plug>(mykey)rm :<C-u> Unite ref/man<CR>
"}}}2

"}}}1
