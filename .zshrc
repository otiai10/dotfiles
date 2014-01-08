# ----- alias ------
## {{{ generals
alias ls='ls -G' # MacOS
alias ll='ls -la'
alias  b='cd ..'
## }}}
## {{{ git
alias st='git status'
alias br='git branch'
alias dv='git diff | vim -'
alias stg='git diff --cached | vim -'
alias cho='git checkout'
alias com='git commit'
### }}}
## {{{ tmux
alias tl='tmux ls'
alias ta='tmux a'
alias t='tmux'
## }}}

# ----- setting -----
## {{{ 言語設定
export LANG=ja_JP.UTF-8
## }}}
## {{{ ビープ音ならさない
setopt no_beep
## }}}
## {{{ 引数も補完
setopt magic_equal_subst
## }}}

# ----- PROMPT -----
PROMPT=$'%{\e[34;1m%}[%*] → %{\e[0m%}'
RPROMPT=$'`branch-status-check` %~' # %~はpwd
# {{{ methods for RPROMPT
setopt prompt_subst #表示毎にPROMPTで設定されている文字列を評価する
# fg[color]表記と$reset_colorを使いたい
# @see https://wiki.archlinux.org/index.php/zsh
autoload -U colors; colors
function branch-status-check {
    local prefix branchname suffix
        # .gitの中だから除外
        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
            return
        fi
        branchname=`get-branch-name`
        # ブランチ名が無いので除外
        if [[ -z $branchname ]]; then
            return
        fi
        prefix=`get-branch-status` #色だけ返ってくる
        suffix='%{'${reset_color}'%}'
        echo ${prefix}${branchname}${suffix}
}
function get-branch-name {
    # gitディレクトリじゃない場合のエラーは捨てます
    echo `git rev-parse --abbrev-ref HEAD 2> /dev/null`
}
function get-branch-status {
    local res color
        output=`git status 2> /dev/null`
        if [[ -n `echo $output | grep "^nothing to commit"` ]]; then
            res=':' # status Clean
            color='%{'${fg[green]}'%}'
        elif [[ -n `echo $output | grep "^# Untracked files:"` ]]; then
            res='?:' # Untracked
            color='%{'${fg[yellow]}'%}'
        elif [[ -n `echo $output | grep "^# Changes not staged for commit:"` ]]; then
            res='M:' # Modified
            color='%{'${fg[red]}'%}'
        else
            res='A:' # Added to commit
            color='%{'${fg[cyan]}'%}'
        fi
        # echo ${color}${res}'%{'${reset_color}'%}'
        echo ${color} # 色だけ返す
}
# }}}

# ----- PATH -----
export PATH=/bin:/usr/bin:/usr/local/bin:$PATH
## {{{ golang
export GOROOT=$HOME/go
export GOPATH=$HOME/proj/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
## }}}
## {{{ pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi
# }}}
## {{{ nvm
source ${HOME}/.nvm/nvm.sh
# }}}
