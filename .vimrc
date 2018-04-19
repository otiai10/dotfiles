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
" set statusline=\ %f\ %r%{'['.&enc.'\ x\ '.&fenc.']'}%m%=%l/%L,%v%r\ \ [%<%{fnamemodify(getcwd(),':~')}]
" let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
" if has('syntax')
"   augroup InsertHook
"     autocmd!
"     autocmd InsertEnter * call s:StatusLine('Enter')
"     autocmd InsertLeave * call s:StatusLine('Leave')
"   augroup END
" endif
" let s:slhlcmd = ''
" function! s:StatusLine(mode)
"   if a:mode == 'Enter'
"     silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
"     silent exec g:hi_insert
"   else
"     highlight clear StatusLine
"     silent exec s:slhlcmd
"   endif
" endfunction
" function! s:GetHighlight(hi)
"   redir => hl
"   exec 'highlight '.a:hi
"   redir END
"   let hl = substitute(hl, '[\r\n]', '', 'g')
"   let hl = substitute(hl, 'xxx', '', '')
"   return hl
" endfunction
" }}}

" {{{ tmp
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" function! ColorSchemeLottery()
"     let h = strftime("%H") % 6
"     if h == 0
"         colorscheme koehler
"     elseif h == 1
"         colorscheme zellner
"     elseif h == 2
"         colorscheme peachpuff
"     elseif h == 3
"         colorscheme slate
"     elseif h == 4
"         colorscheme murphy
"     else
"         colorscheme delek
"     endif
" endfunction
"
" call ColorSchemeLottery()

" function! s:ColorSchemeLottery()
"     let schemes = ["koehler", "zellner", "peachpuff", "slate", "murphy", "delek"]
"     let l = len(schemes)
"     let i = strftime("%H") % l
"     return schemes[i]
" endfunction
"
" colorscheme s:ColorSchemeLottery()
" }}}

" {{{ vim-goの設定
" call plug#begin()
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" call plug#end()
" }}}
