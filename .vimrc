
" {{{ metaファイル
set viminfo+=n~/.dotfiles/.vim/.viminfo
" }}}

" {{{ 文字エンコーディング
set encoding=utf8
set fileencoding=utf8
" }}}

" {{{ シンタックス色
syntax on
colorscheme desert
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

" {{{ Status Line: https://stackoverflow.com/a/10416234
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
" set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
" }}}
