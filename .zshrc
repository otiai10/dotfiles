# lang
export LANG=ja_JP.UTF-8

# beep sound
setopt no_beep

# History
export HISTFILE=${HOME}/.dotfiles/.zsh/history

# complement
setopt magic_equal_subst
autoload -Uz compinit
compinit -d ${HOME}/.dotfiles/.zsh/zcompdump

# Others
source ${HOME}/.dotfiles/.zsh/paths
source ${HOME}/.dotfiles/.zsh/prompts
source ${HOME}/.dotfiles/.zsh/aliases
source ${HOME}/.dotfiles/.zsh/bootstrap
