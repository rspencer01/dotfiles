# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias dog='pygmentize -g -O style=colorful,linenos=1'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

### Custom prompt
# regular colors
bash_prompt()
{
  local K="\[\033[0;30m\]"    # black
  local R="\[\033[0;31m\]"    # red
  local G="\[\033[0;32m\]"    # green
  local Y="\[\033[0;33m\]"    # yellow
  local B="\[\033[0;34m\]"    # blue
  local M="\[\033[0;35m\]"    # magenta
  local C="\[\033[0;36m\]"    # cyan
  local W="\[\033[0;37m\]"    # white
  # emphasized (bolded) colors
  local BK="\[\033[1;30m\]"
  local BR="\[\033[1;31m\]"
  local BG="\[\033[1;32m\]"
  local BY="\[\033[1;33m\]"
  local BB="\[\033[1;34m\]"
  local BM="\[\033[1;35m\]"
  local BC="\[\033[1;36m\]"
  local BW="\[\033[1;37m\]"
  # Shorten
  function get_shorten_pwd {
    ~/dotfiles/utils/path_shorten "`pwd`"
  }
  prmptDate="$BK┌($Y\t$BK)"
  prmptWd="$BK($BC$(get_shorten_pwd)$BK)"
  prmptUserHost="$BK($C\u$W@$G\h$BK)"
  prmptGitBranchCmd='__git_ps1 && __git_ps1 (%s)'
  prmptEndDollar="\n└─>$W "
  # No space before
  function parse_git_dirty {
    [[ $(git status --porcelain 2> /dev/null | tail -n1) != "" ]] && echo -n "$R" || echo -n "$G"
  }
  function git_branch {
    local git_status="$(git status 2> /dev/null)"
    local on_branch="On branch ([^${IFS}]*)"
    local on_commit="HEAD detached at ([^${IFS}]*)"

    if [[ $git_status =~ $on_branch ]]; then
      local branch=${BASH_REMATCH[1]}
      echo -n "$BK─("
      parse_git_dirty
      echo "$branch$BK) "
    elif [[ $git_status =~ $on_commit ]]; then
      local commit=${BASH_REMATCH[1]}
      echo -n "$BK─("
      parse_git_dirty
      echo "$commit$BK) "
    fi
  }
  function whereamifrom {
    # This is only at startup, but that's ok
    local SESS_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
    if [[ ! -z "${SESS_IP// }" ]]; then
      echo -n "$BK─("
      echo -n "${R}src:$SESS_IP"
      echo -n "$BK)"
    fi
  }
  PS1="\n$prmptDate─$prmptUserHost$(whereamifrom)─$prmptWd$(git_branch)$prmptEndDollar"
}

PROMPT_COMMAND=bash_prompt

# Usage:
#  When in /some/folder/here/and/now type `cd he` to go to /some/folder/here
function up {
      cd `expr "$PWD" : "^\(.*$1[^/]*\)"`
}

### My programs
export PATH=$PATH:/home/robert/bin:.
# This breaks things?
export LD_LIBRARY_PATH=/usr/local/lib
export EDITOR=vim
export ANSIBLE_NOCOWS=1

### My own custom reminder script
remind

### cd bookmarks
function cdb() { 
  USAGE="Usage: cdb [-c|-g|-d|-l] [bookmark]" ;
  if  [ ! -e ~/.cd_bookmarks ] ; then
    mkdir ~/.cd_bookmarks
  fi

  case $1 in
    # create bookmark
    -c) shift
      if [ ! -f ~/.cd_bookmarks/$1 ] ; then
        echo "cd `pwd`" > ~/.cd_bookmarks/"$1" ;
      else
        echo "Try again! Looks like there is already a bookmark '$1'"
      fi
      ;;
    # goto bookmark
    -g) shift
      if [ -f ~/.cd_bookmarks/$1 ] ; then
        source ~/.cd_bookmarks/"$1"
      else
        echo "Mmm...looks like your bookmark has spontaneously combusted. What I mean to say is that your bookmark does not exist." ;
      fi
      ;;
    # delete bookmark
    -d) shift
      if [ -f ~/.cd_bookmarks/$1 ] ; then
        rm ~/.cd_bookmarks/"$1" ;
      else
        echo "Oops, forgot to specify the bookmark" ;
      fi
      ;;
    # list bookmarks
    -l) shift
      ls -l ~/.cd_bookmarks/ ;
      ;;
    *) echo "$USAGE" ;
      ;;
  esac
}

PERL_MB_OPT="--install_base \"/home/robert/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/robert/perl5"; export PERL_MM_OPT;
