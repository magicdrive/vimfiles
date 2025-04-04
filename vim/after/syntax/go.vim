" ---------------------------------------------
" Highlighting for Go error-related identifiers
" ---------------------------------------------

" Matches generic 'err' or 'errno'
syn match goErr "err"
syn match goErr "errno"

" Matches identifiers ending with 'Err' or 'Error'
syn match goErr "[a-zA-Z0-9]*Err"
syn match goErr "[a-zA-Z0-9]*Error"

" Matches identifiers starting with 'Error' or 'Err'
syn match goErr "Error[a-zA-Z0-9]*"
syn match goErr "Err[a-zA-Z0-9]*"

" Matches common Go formatting function for errors
syn match goErr "Errorf"

" Highlight style for general error terms
highlight goErr cterm=bold ctermfg=214

" Matches variants of common error package names
syn match goErrors "errors"
syn match goErrors "commonerror[s]\{0,1}"
syn match goErrors "commonError[s]\{0,1}"
syn match goErrors "CommonError[s]\{0,1}"
syn match goErrors "common_error[s]\{0,1}"
syn match goErrors "cerror[s]\{0,1}"

" Highlight style for common error packages/types
highlight goErrors cterm=bold ctermfg=168

" Matches error codes with numeric suffixes (e.g. err123)
syn match goErrN "err[0-9]\{1,}"
syn match goErrN "[a-zA-Z0-9]*Err[0-9]\{1,}"
syn match goErrN "[a-zA-Z0-9]*Error[0-9]\{1,}"

" Highlight style for error identifiers with numbers
highlight goErrN cterm=bold ctermfg=220

" Matches message-related error identifiers
syn match goErrMessage "errorMessage[s]\{0,1}"
syn match goErrMessage "ErrorMessage[s]\{0,1}"
syn match goErrMessage "error_message[s]\{0,1}"

" Highlight style for error message-related words
highlight goErrMessage cterm=bold ctermfg=208


" ------------------------------------------------------
" Exclusion zones to prevent unwanted highlighting
" (strings, comments, etc.)
" ------------------------------------------------------

" Single and backtick string literals
syntax region goStringCustom start=+"+ skip=+\\\\\|\\"+ end=+"+ keepend contains=NONE
syntax region goStringCustom start=+`+ skip=+\\\\\|\\"+ end=+`+ keepend contains=NONE
highlight default link goStringCustom String

" Single-line comment (// ...)
syntax region goCommentCustom start=+//+ end=+$+ keepend contains=NONE
highlight default link goCommentCustom Comment

" Multi-line block comment (/* ... */)
syntax region goCommentCustomMulti start="/\*" end="\*/" keepend contains=NONE
highlight default link goCommentCustomMulti Comment


" ------------------------------------------------------
" Highlight Go struct field keys (e.g. Name:, Age:)
" while excluding common non-struct contexts
" ------------------------------------------------------

" Line-start keys (e.g. in block structs), excluding `case` and `default`
syntax match goStructKeyLineStart '^\s*\%(case\|default\)\>\@! \zs[a-zA-Z_][a-zA-Z0-9_]*\ze\s*:\%(=\)\@!' containedin=ALLBUT,goStringCustom,goCommentCustom,goCommentCustomMulti

" Inline keys (e.g. { Name: "Taro" }), excluding := assignments
syntax match goStructKeyInline '\<\h\w*\s*:\%(=\)\@!' contained containedin=ALLBUT,goStringCustom,goCommentCustom,goCommentCustomMulti

" Highlight style for struct keys
highlight default goStructKey ctermfg=105
highlight default link goStructKeyLineStart goStructKey
highlight default link goStructKeyInline goStructKey





















