let g:memolist_memo_suffix="txt"
let g:memolist_memo_date="%Y-%m-%d %H:%M"
"let g:memolist_memo_date = "epoch"
"let g:memolist_memo_date = "%D %T"
let g:memolist_prompt_tags=1
let g:memolist_prompt_categories=1
let g:memolist_qfixgrep=1
let g:memolist_vimfiler=1
"let g:memolist_template_dir_path='$HOME/.vim/memo/'
let g:memolist_path = "$HOME/.vim/memo/"

"# key mapping
nnoremap mn  :MemoNew<CR>
nnoremap ml  :MemoList<CR>
nnoremap mg  :MemoGrep<CR>

