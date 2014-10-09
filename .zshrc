# lang
export LANG=ja_JP.UTF-8

# beep sound
setopt no_beep

# complement
setopt magic_equal_subst
autoload -Uz compinit
compinit

# prompt
PROMPT=$'%B%* `get-branch-status-color`(๑˃̵ᴗ˂̵)و%f %b'
RPROMPT=$'`branch-status-check` %~'
setopt prompt_subst #表示毎にPROMPTで設定されている文字列を評価する
function pre {
    PROMPT='%% '
    RPROMPT=''
}

# alias
alias ll='ls -la'
alias vi='vim'
alias  b='cd ..'

# alias.git
alias st='git status'
alias gid='git diff'
alias dv='git diff | vim -'
alias br='git branch'
alias cho='git checkout'
alias stg='git diff --cached'
alias com='git commit'

# alias.tmux
alias t='tmux'
alias ta='tmux a'
alias tl='tmux ls'

# python
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# go
export GOROOT=$HOME/.go
export GOPATH=$HOME/proj/go
export PATH=${PATH}:$GOROOT/bin:$GOPATH/bin

# nvm
source ~/.nvm/nvm.sh

# {{{ methods for RPROMPT
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
        prefix=`get-branch-status-color` #色だけ返ってくる
        suffix='%{'${reset_color}'%}'
        echo ${prefix}${branchname}${suffix}
}
function get-branch-name {
    # gitディレクトリじゃない場合のエラーは捨てます
    echo `git rev-parse --abbrev-ref HEAD 2> /dev/null`
}
function get-branch-status-color {
    local res color
        output=`git status -s 2> /dev/null`
        if [[ -z "$output" ]]; then
            res=':' # status Clean
            color='%{'${fg[green]}'%}'
        elif [[ $output =~ "[\n]?\?\? " ]]; then
            res='?:' # Untracked
            color='%{'${fg[yellow]}'%}'
        elif [[ $output =~ "[\n]? M " ]]; then
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
