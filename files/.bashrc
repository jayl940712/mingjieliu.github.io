# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
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

if [ -f $HOME/../Modules/init/bash ]; then
    . $HOME/../Modules/init/bash
    module load 
fi


#module load cadence/ic617
module load mentor/calibre/2017
module load cadence/2009
module load cadence/innovus
module load synopsys/vcs/2017
#module load synopsys/hspice
#module load syn/cosmos
# Directory for FreePDK45
export PDK_DIR=/home/unga/jayliu/library/FreePDK45
alias setup_freepdk15='source /home/unga/jayliu/library/FreePDK15/cdslib/setup/setup.sh'
#alias setup_freepdk45='/home/unga/jayliu/library/FreePDK45/ncsu_basekit/cdssetup/setup.csh'



export PATH=$HOME/local/bin:$PATH
export BASE=/home/local/eda10/jayliu
#export PATH=/home/polaris/yibolin/Libraries/git-lfs-1.4.2/bin:$PATH

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


#. /home/polaris/yibolin/Downloads/torch/install/bin/torch-activate

export PYBIND11_DIR="/home/local/eda09/keren/libs/pybind11"

export GTEST_DIR="/home/local/eda09/keren/libs/googletest"

#export LIMBO_DIR="/home/local/eda09/keren/projects/Limbo_old"
#export LIMBO_INC="/home/local/eda09/keren/projects/Limbo_old/include"
export LIMBO_DIR="/home/local/eda09/keren/projects/Limbo"
export LIMBO_INC="/home/local/eda09/keren/projects/Limbo/include"

export SPARSE_HASH_DIR="/home/local/eda09/keren/libs/sparsehash"

export ABC_DIR="/home/local/eda09/keren/libs/abc"

export WNLIB_DIR="/home/local/eda09/keren/libs/wnlib"

export LPSOLVE_DIR="/home/local/eda09/keren/libs/lp_solve_5.5"

export LEMON_DIR="/home/local/eda06/haoc/libs/lemon"

#export GUROBI_HOME="/home/local/eda09/keren/common/libs/gurobi901/linux64"

export DGLBACKEND=pytorch

#export EIGEN_INC="/home/local/eda09/keren/common/libs/eigen-3.3.3"
export EIGEN_INC="/home/local/eda10/jayliu//library/eigen-3.3.3"

export PATH=/home/local/eda10/jayliu/library/XyceLibs/Serial/bin:$PATH

export PATH=$PATH:/opt/docker/bin

# Skywater 130 tools
export PATH=$PATH:/home/local/eda10/jayliu/install/magic/bin
export PATH=$PATH:/home/local/eda10/jayliu/install/netgen/bin
export PATH=$PATH:/home/local/eda10/jayliu/install/xcircuit/bin
export PATH=$PATH:/home/local/eda10/jayliu/install/xschem/bin
export PATH=$PATH:/home/local/eda10/jayliu/install/ngspice/bin


#export CXX="/home/local/eda09/keren/common/libs/gcc-9.2.0/gcc-9.2.0-target/bin/g++"
#export CC="/home/local/eda09/keren/common/libs/gcc-9.2.0/gcc-9.2.0-target/bin/gcc"
#export LD_LIBRARY_PATH="/home/local/eda09/keren/common/libs/gcc-9.2.0/gcc-9.2.0-target/lib:/home/local/eda09/keren/common/libs/gcc-9.2.0/gcc-9.2.0-target/lib32:/home/local/eda09/keren/common/libs/gcc-9.2.0/gcc-9.2.0-target/lib64:$LD_LIBRARY_PATH"
export CXX="/home/local/eda10/jayliu/library/gcc-9.2.0/gcc-9.2.0-target/bin/g++"
export CC="/home/local/eda10/jayliu/library/gcc-9.2.0/gcc-9.2.0-target/bin/gcc"
export LD_LIBRARY_PATH="/home/local/eda10/jayliu/library/gcc-9.2.0/gcc-9.2.0-target/lib:/home/local/eda10/jayliu/library/gcc-9.2.0/gcc-9.2.0-target/lib32:/home/local/eda10/jayliu/library/gcc-9.2.0/gcc-9.2.0-target/lib64:$LD_LIBRARY_PATH"

export PDK_ROOT="/home/local/eda09/keren/common/pdks/"
export PDKPATH=$PDK_ROOT/sky130A
#

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/local/eda10/jayliu/mengli/anaconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/local/eda10/jayliu/mengli/anaconda/etc/profile.d/conda.sh" ]; then
        . "/home/local/eda10/jayliu/mengli/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/local/eda10/jayliu/mengli/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

