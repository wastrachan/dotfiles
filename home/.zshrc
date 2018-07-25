############################ Oh-My-ZSH Configuration

# Path to oh-my-zsh installation
export ZSH=${ZDOTDIR:-$HOME}/.oh-my-zsh

# Select Theme
ZSH_THEME="lukerandall"

# Disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# Oh-My-ZSH Plugins
plugins=(git python pip sudo docker aws)

# Set up Oh-My-ZSH
source $ZSH/oh-my-zsh.sh


############################ Personal Configuration

# Load Environment Variables
if [ -f "${ZDOTDIR:-$HOME}/.environment" ]; then
    source "${ZDOTDIR:-$HOME}/.environment"
fi

# Load Aliases
source "${ZDOTDIR:-$HOME}/.aliases"

# Update Path
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH  # Path to local binaries
PATH=./node_modules/.bin:$PATH  # Local node modules, relative to directory

# Set up pyenv
if [ -d "$HOME/.pyenv" ]; then
    export PYENV_SHELL="zsh"
    export PYENV_ROOT="$HOME/.pyenv"
    PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    if [ -d "$HOME/.pyenv/plugins/pyenv-virtualenv" ]; then
        eval "$(pyenv virtualenv-init -)"
    fi
fi

# Set up RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
PATH="$PATH:$HOME/.rvm/bin"
export RUBYGEMS_GEMDEPS=-  # Save us from bundle exec
