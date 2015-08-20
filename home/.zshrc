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
plugins=(brew fabric git knife python pip vagrant sudo wd)

# Set up Oh-My-ZSH
source $ZSH/oh-my-zsh.sh


############################ Personal Configuration

# Load Aliases
source "${ZDOTDIR:-$HOME}/.aliases"

# Update Path
export PATH=$HOME/bin:/usr/local/bin:$PATH  # Path to local binaries
PATH=./node_modules/.bin:$PATH  # Local node modules, relative to directory

# Set up PyEnv
export PYENV_SHELL="zsh"
export PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - )"

# Virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Development
source /usr/local/bin/virtualenvwrapper.sh

# Stop that awful error when compiling
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

# Phobio-Related stuff
export PHOBIO_TRANSLATIONS_PATH="/Users/rew1red/Dropbox/Phobio/Phobio Translations"
