# Custom Scripts definitions.
# You may want to put all your scripts into a separate file like
# ~/.bash_aliases_custom_scripts, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.


# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\] at \[\033[01;34m\]\W\[\033[31m\]\$(parse_git_branch)\[\033[00m\] \$ "

# Use RALT as LEFT and RCTL as RIGHT since the laptop keyboard's
# LEFT and RIGHT arrow keys are not working properly.
# Ref: https://unix.stackexchange.com/a/65600
# Additionally, disable the LEFT and RIGHT arrow keys for good measure.
if [ -e "$HOME/.xkb/keymap/mykbd" ]; then
  xkbcomp -I$HOME/.xkb ~/.xkb/keymap/mykbd $DISPLAY 2> /dev/null
  xmodmap -e 'keycode 113='   # Disable LEFT arrow key
  xmodmap -e 'keycode 114='   # Disable RIGHT arrow key
fi
#
# To disconnect latptop's internal keyboard, type:
#   xinput float "AT Translated Set 2 keyboard"
# Read here: https://askubuntu.com/questions/160945/is-there-a-way-to-disable-a-laptops-internal-keyboard

# Manage dotfiles with git bare repo.
# Ref: https://news.ycombinator.com/item?id=11071754
if [ -d "$HOME/.cfg" ]; then
  alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  # cfg config status.showUntrackedFiles no
fi
