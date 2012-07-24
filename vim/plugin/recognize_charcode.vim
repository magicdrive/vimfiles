"==============================================================
" �����R�[�h�̎����F���v���O�C��
" recognize_charcode.vim
"==============================================================
" [�Q�l] (����)
" �E�R�[�h�̂قڑS�Ă��A����Wiki����́u�����R�[�h�̎����F���v
"   (http://www.kawaz.jp/pukiwiki/?vim#cb691f26)���g�p�����Ē����Ă���
" �E����Wiki����̃R�[�h�ɑ΂���C���́AHeavens hell����́uvim �ł��܂ɕ��������v
"   (http://d.hatena.ne.jp/heavenshell/20080105/1199536148)
" �E�v���O�C���̍����́AKaoriYa.net����́uVim���{��h�L�������g�v
"   (http://www.kaoriya.net/vimdoc_j/)����_�E�����[�h�����X�i�b�v�V���b�g����
"   runtime/doc/usr_41.jax 41.11�߁u�v���O�C���������v�A
"   �y�сA��������VIM�g������́u1�t�@�C���ō\�������v���O�C���̃e���v���[�g�v
"   (http://nanasi.jp/articles/code/stdplugin/template.html)���Q�l�ɂ���
"
" [���̃v���O�C���̎��s��]
" (1) ���̃t�@�C���� �C�Ӄf�B���N�g��/recognize_charcode.vim �ɕۑ�����
" (2) ~/.vimrc �� 
"        source �C�Ӄf�B���N�g��/recognize_charcode.vim
"     ��������
"     �u�C�Ӄf�B���N�g���v �� �u~/.vim�v �Ƃ���̂��W���炵��


"--------------------------------------------------------------

" �v���O�C���ݒ�
" �v���O�C����2��ǂݍ��܂�邱�Ƃ�h�~
if exists("loaded_recognize_charcode")
  finish
endif
let loaded_recognize_charcode = 1

" ���[�U�ݒ�𓦂�
let s:save_cpo = &cpo
set cpo&vim

"-------------------- �����R�[�h�F���� �J�n --------------------

if &encoding !=# 'utf-8'
"�@set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconv��eucJP-ms�ɑΉ����Ă��邩���`�F�b�N
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconv��JISX0213�ɑΉ����Ă��邩���`�F�b�N
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif

  " fileencodings���\�z
  if &encoding ==# 'utf-8'
    
    "(A)
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc

    if s:fileencodings_default =~ 'utf-8'
      let &fileencodings = &fileencodings .','. s:fileencodings_default
      let &fileencodings = substitute(&fileencodings, "utf-8", "utf-8,cp932", "g")
    else
      let &fileencodings = &fileencodings .',cp932,'. s:fileencodings_default
    endif
    unlet s:fileencodings_default
    "(B)

  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " �萔������
  unlet s:enc_euc
  unlet s:enc_jis
endif
" ���{����܂܂Ȃ��ꍇ�� fileencoding �� encoding ���g���悤�ɂ���
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" ���s�R�[�h�̎����F��
set fileformats=unix,dos,mac
" ���Ƃ����̕����������Ă��J�[�\���ʒu������Ȃ��悤�ɂ���
if exists('&ambiwidth')
  set ambiwidth=double
endif

"-------------------- �����R�[�h�F���� �I�� --------------------

" �������Ă������[�U�̐ݒ���C��
let &cpo = s:save_cpo
