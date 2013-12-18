# ----- alias ------
## generals
alias ls='ls -G' # MacOS
## git
alias st='git status'
alias br='git branch'
alias dv='git diff | vim -'
alias stg='git diff --cached | vim -'

# ----- PROMPT -----
## PROMPT
PROMPT=$'[%*] → '
## RPROMPT
RPROMPT=$'`branch-check` %~'
function branch-check {
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
        echo "${prefix} ${branchname}"
}
function get-branch-name {
    echo `git branch 2> /dev/null` | sed -e s/\*//g
}
function get-branch-status {
    local res
        output=`git status 2> /dev/null`
        if [[ -n `echo $output | grep "^nothing to commit"` ]]; then
            res='cleanです'
        elif [[ -n `echo $output | grep "^nothing added"` ]]; then
            res='1'
        elif [[ -n `echo $output | grep "^Untracked"` ]]; then
            res='new fileがあります'
        else
            res='modifiedがあります'
        fi
        echo $res
}

setopt prompt_subst #表示毎にPROMPTで設定されている文字列を評価する

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
