export HISTSIZE=2000
export HISTCONTROL=ignoreboth
source ~/.dotfiles/.git-prompt.sh

function parse_git_branch {
      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local    WHITE_BR="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local       WHITE="\[\033[00m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

PS1="${TITLEBAR}\
$BLUE[$RED\u@\h:\w$GREEN\$(__git_ps1 \" (%s)\")$BLUE]$WHITE
$BLUE[$WHITE_BR\\T$BLUE]$WHITE\
> "

PS2='> '
PS4='+ '
}
proml


if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi


