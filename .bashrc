# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
    PS1='\n${debian_chroot:+($debian_chroot)}[\t][\d] \[\033[01;32m\]\u@\h\[\033[00m\]\n \[\033[01;34m\]\w\[\033[00m\]:\n \$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\n\$ '
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
#alias ls='ls -h'
#alias ll='ls -alhF'
#alias la='ls -A'
#alias l='ls -CF'


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
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#path para pantallas
export PATH=${PATH}:~/.screenlayout

#path para android SDK
export PATH=${PATH}:~/bin/android-sdk/tools/
#CLASSPATH=${CLASSPATH}:

#path de prism
export PATH=${PATH}:~/bin/prism/

#path del local bin
export PATH=${PATH}:~/bin/

#
export PATH=${PATH}:~/bin/nwjs-v0.14.4-linux-ia32/

#parh de libreras instaladas de java
##puede causar problemas???
export CLASSPATH=${CLASSPATH}:/usr/share/java/*

#path para jade framework
#export CLASSPATH=${CLASSPATH}:~/bin/jade/lib/jade.jar
#export CLASSPATH=${CLASSPATH}:~/bin/jade/lib/commons-codec/commons-codec-1.3.jar
#export CLASSPATH=${CLASSPATH}:~/bin/jade/lib/base64.jar

#path para jena framework
export JENAROOT=~/bin/Jena-2.6.4
#--------------------------------

JAVA_HOME="/usr/lib/jvm/java-7-openjdk-i386/"
          #/usr/lib/jvm/java-6-sun-1.6.0.26
          #/usr/lib/jvm/java-7-openjdk-i386/
export JAVA_HOME
export PATH=${PATH}:${JAVA_HOME}/bin

export PATH=${PATH}:/home/jlgb/bin/ontovcs/bin/

export PATH=${PATH}:/home/jlgb/bin/nwjs/

export PATH=${PATH}:/home/jlgb/bin/android-studio/bin/ #studio.sh
export PATH=${PATH}:/home/jlgb/Android/Sdk/tools/
export PATH=${PATH}:/home/jlgb/bin/hp4600/

#fortune
#fortune asimov.fortunes bofh-excuses ciencia.fortunes filosofia.fortunes lao-tse.fortunes leydemurphy.fortunes nietzsche.fortunes
#fortune literature discworld humorix-misc humorix-stories


#export LC_ALL=es_MX.utf8
#export LC_ALL=es_ES.UTF-8
#export LC_NUMERIC


#Starting ssh agent
sh /home/jlgb/bin/.sshadd.sh
#agent_started=0
#if ! env | grep -q SSH_AGENT_PID >/dev/null; then
#  echo "Starting ssh agent"
#  eval $(ssh-agent -s)
#  agent_started=1
#fi
#