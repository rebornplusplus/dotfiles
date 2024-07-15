# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Default GPG Key
export GPGKEY=1567B45A

# set PATH so it includes Go (/usr/local/go) if it exists
if [ -d "/usr/local/go" ] ; then
    PATH="/usr/local/go/bin:$PATH"
fi

# set PATH so it includes Go ($HOME/go) if it exists
if [ -d "$HOME/go" ] ; then
    PATH="$HOME/go/bin:$PATH"
fi

# set PATH so it includes pyenv (~/.pyenv) if it exists
if [ -d "$HOME/.pyenv" ]; then
	export PYENV_ROOT="$HOME/.pyenv"
	command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
fi

# source cargo env if it exists
if [ -f "$HOME/.cargo" ]; then
	. "$HOME/.cargo/env"
fi

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

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
