"#----------------------------------------------------------#
"#                                                          #
"# eskk.vim日本語入力設定                                   # 
"#                                                          #
"#----------------------------------------------------------#
if has('vim_starting')
	let g:eskk_dictionary = '~/.skk-jisyo'

	if has('mac')
		let g:eskk_large_dictionary = "~/Library/Application\ Support/AquaSKK/SKK-JISYO.L"
	elseif has('win32') || has('win64')
		let g:eskk_large_dictionary = "~/SKK_JISYO.L"
	else
	endif
endif

let g:eskk_debug = 0
let g:eskk_egg_like_newline = 1
let g:eskk_revert_henkan_style = "okuri"
let g:eskk_enable_completion = 0
let g:skk_control_j_key = '<C-k>'

