# ----- alias ------
## generals
alias ls='ls -G' # MacOS
## git
alias st='git status'
alias br='git branch'
alias dv='git diff | vim -'
alias stg='git diff --cached | vim -'
alias com='git commit'

# ----- PROMPT -----
## PROMPT
PROMPT=$'[%*] → '
## RPROMPT
RPROMPT=$'`branch-status-check` %~' # %~はpwd
setopt prompt_subst #表示毎にPROMPTで設定されている文字列を評価する
# {{{ methods for RPROMPT
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
        prefix=`get-branch-status`
        suffix=''
        echo "${prefix}${branchname}${suffix}"
}
function get-branch-name {
    echo `git branch 2> /dev/null` | sed -e s/\*\ //g
}
function get-branch-status {
    local res
        output=`git status 2> /dev/null`
        if [[ -n `echo $output | grep "^nothing to commit"` ]]; then
            res='' # status Clean
        elif [[ -n `echo $output | grep "^# Untracked files:"` ]]; then
            res='?:' # Untracked
        elif [[ -n `echo $output | grep "^# Changes not staged for commit:"` ]]; then
            res='M:' # Modified
        else
            res='A:' # Added to commit
        fi
        echo $res
}
# }}}

# ----- PATH -----
export PATH=/bin:/usr/bin:/usr/local/bin:$PATH

## golang
export GOROOT=$HOME/go
export GOPATH=$HOME/proj/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

## pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi

## nvm
source ${HOME}/.nvm/nvm.sh
