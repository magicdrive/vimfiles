"#### neocomplcache setting ###

"# Disable AutoComplPop.
let g:acp_enableAtStartup = 0
"# Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
"# Use smartcase.
let g:neocomplcache_enable_smart_case = 1
"# Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
"# Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
"# Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'


"# Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

"# Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif

"# NeoCompleCacheToggle
"nnoremap ,t :NeoComplCacheToggle<CR>

