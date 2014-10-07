" {{{ 文字エンコーディング
set encoding=utf8
set fileencoding=utf8
" }}}

" {{{ シンタックス色
syntax on
colorscheme delek
" }}}

" {{{ タブスペース
set expandtab
set tabstop=4
set shiftwidth=4
" }}}

" {{{ 検索
set showmatch
set hlsearch
set laststatus=2
" }}}

" {{{ 移動
inoremap <c-d> <delete>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>
" }}}

" {{{ タブ移動
noremap tn :tabn<cr>
" }}}

" {{{ ビープ音
set visualbell
" }}}

" {{{ 折りたたみ
set foldmethod=marker
" }}}

" {{{ ステータスライン
set statusline=\ %f\ %r%{'['.&enc.'\ x\ '.&fenc.']'}%m%=%l/%L,%v%r\ \ [%<%{fnamemodify(getcwd(),':~')}]
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif
let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction
function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
" }}}
