# Custom Scripts definitions.
# You may want to put all your scripts into a separate file like
# ~/.bash_aliases_custom_scripts, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.


# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\] at \[\033[01;34m\]\W\[\033[31m\]\$(parse_git_branch)\[\033[00m\] \$ "
