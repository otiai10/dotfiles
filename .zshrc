# terminal
# echo -ne "\033]0;${USER}@${LANG}\007"
# function chit() {
#     echo -ne "\033]0;$1\007"
# }

# Prefer Celler bin
export PATH=/usr/local/bin:$PATH

function envinstall() {
    envs=`docker-machine env ${1}`
    eval ${envs}
    echo -e "${envs}\n...\nENVs of ${1} installed"
}

# lang
export LANG=ja_JP.UTF-8

# beep sound
setopt no_beep

# complement
setopt magic_equal_subst
autoload -Uz compinit
compinit

# prompt
function init_prompt {
    PROMPT=$'%B%* `get-branch-status-color`(๑˃̵ᴗ˂̵)و%f %b'
    RPROMPT=$'`branch-status-check` %~'
    setopt prompt_subst #表示毎にPROMPTで設定されている文字列を評価する
}
init_prompt || PROMPT=$'%B%% %b'

function pre {
    PROMPT='%% '
    RPROMPT=''
}

# alias
case "${OSTYPE}" in
darwin*)
    alias ll='ls -lGa'
    alias chrome.exe='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
    ;;
linux*)
    alias ll='ls -la --color'
esac
# change dir color of ls
# http://mironal-memo.blogspot.jp/2012/09/macosx-ls.html
export LSCOLORS=ExFxCxDxBxegedabagacad
alias vi='vim'
alias  b='cd ..'

# alias.git
alias st='git status'
alias dv='git diff | vim -'
alias br='git branch'
alias cho='git checkout'
alias stg='git diff --cached'
alias com='git commit'

# alias.tmux
alias ta='tmux a'
alias tl='tmux ls'

# alias for IPAddress
alias myip='curl ifconfig.co'

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# go
export GOROOT=$HOME/.go/1.10.3
export GOPATH=$HOME/proj/go
export PATH=${PATH}:$GOROOT/bin:$GOPATH/bin

# nvm
source ~/.nvm/nvm.sh

# Downloaded tools
export PATH=${PATH}:$HOME/proj/opt/bin

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
        output=`git status -s 2>&1`
        if [[ $output =~ "fatal" ]]; then
            res=''
            color='%{'${fg[white]}'%}'
        elif [[ -z $output ]]; then
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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/otiai10/.google-cloud-sdk/path.zsh.inc' ]; then source '/Users/otiai10/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/otiai10/.google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/otiai10/.google-cloud-sdk/completion.zsh.inc'; fi

# goapp command
export PATH=${HOME}/.google-cloud-sdk/platform/google_appengine/goroot-1.9/bin:${PATH}
export APPENGINE_DEV_APPSERVER=${HOME}/.google-cloud-sdk/bin/dev_appserver.py

# http://otiai10.hatenablog.com/entry/2017/06/07/112205
export GOAPP_WATCH_CWD=1

# Python with virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1
source ${HOME}/.venv/default/bin/activate

# added by travis gem
[ -f /Users/otiai10/.travis/travis.sh ] && source /Users/otiai10/.travis/travis.sh
export PATH=${HOME}/.cargo/bin:${PATH}
