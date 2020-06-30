#
# If not running interactively, don't do anything
#
case $- in
    *i*) ;;
      *) return;;
esac

#
# Unlimited bash history
#
HISTSIZE=
HISTFILESIZE=

#
# Force commands that you entered on more than one line to be adjusted to fit on only one
#
shopt -s cmdhist

#
# Append to the history file, don't overwrite it
#
shopt -s histappend
PROMPT_COMMAND='history -a'

#
# Do not save lines starting with space, or repeated commands
#
HISTCONTROL=ignoreboth:erasedups

#
# Add timestamp to history
#
HISTTIMEFORMAT="%F %T "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#
# Fix better ls sorting, hidden before visible
#
export LC_COLLATE="C"

#
# Reset SSH env var
#
eval $(tmux showenv -s SSH_AUTH_SOCK 2>/dev/null)

#
# PS1 colors
#
c_red="\[\033[01;31m\]"
c_green="\[\033[01;32m\]"
c_yellow="\[\033[01;33m\]"
c_blue="\[\033[01;34m\]"
c_cyan="\[\033[01;36m\]"
c_clear="\[\033[00m\]"

#
# Echo colors
#
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

#
# Editor
#
export EDITOR=vim

#
# env vars
#
export PATH=${PATH}:/home/jaso/Nextcloud/bin:/home/jaso/bin

#
# Prompt
#
sshkey_available(){
    ssh-add -L 1>/dev/null 2>&1 && echo -e "  "
}
git_branch(){
    __git_ps1 "  (%s)"
}

PS1="${c_green}\u@\h${c_clear} ${c_blue}\w${c_clear}"
PS1+='$(sshkey_available)$(git_branch) $ '

#
# Alias
#
alias ..="cd .."
alias ls="ls -h --group-directories-first --color=auto"
alias ll="ls -l"
alias la="LC_COLLATE=C ls -al"
alias dmesg="sudo dmesg -we --color=always | less -R"
alias df="df -h -xsquashfs -xtmpfs -xdevtmpfs"
alias r="source ~/.bashrc"
alias grep="grep --color=always"
alias k=". kcontext-switcher.sh"
alias ssh-forcepass="ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no"

#
# make less more friendly for non-text input files, see lesspipe(1)
#
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#
# Source other files
#

test -f ~/.fzf.bash && \
    . ~/.fzf.bash

test -f /usr/share/doc/ranger/examples/bash_automatic_cd.sh && \
    . /usr/share/doc/ranger/examples/bash_automatic_cd.sh

# Fedora
test -f /usr/share/doc/ranger/examples/bash_subshell_notice.sh && \
    . /usr/share/doc/ranger/examples/bash_subshell_notice.sh

# Ubuntu
test -f /usr/share/doc/ranger/examples/shell_automatic_cd.sh && \
    . /usr/share/doc/ranger/examples/shell_automatic_cd.sh

# Git
test -f /usr/share/git-core/contrib/completion/git-prompt.sh && \
    . /usr/share/git-core/contrib/completion/git-prompt.sh

# Kubernetes
if which helm >/dev/null 2>&1; then
    . <(helm completion bash)
fi

if which kubectl >/dev/null 2>&1; then
    . <(kubectl completion bash)
fi

