
" {{{ metaファイル
set viminfo+=n~/.dotfiles/.vim/.viminfo
" }}}

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
