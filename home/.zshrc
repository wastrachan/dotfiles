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
PATH=$PATH:/opt/android-sdk-macosx/ant/bin:/opt/android-sdk-macosx/platform-tools:/opt/android-sdk-macosx/tools  # For compiling Android stuff in OS X

# Set up PyEnv
export PYENV_SHELL="zsh"
export PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - )"

# Stop that awful error when compiling
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

# Phobio-Related stuff
export PHOBIO_TRANSLATIONS_PATH="/Users/rew1red/Dropbox/Phobio/Phobio Translations"

export OS_AUTH_URL=https://identity.api.rackspacecloud.com/v2.0/
export OS_AUTH_SYSTEM=rackspace
export OS_REGION_NAME=DFW
export OS_USERNAME=phobio
export OS_TENANT_NAME=738614
export NOVA_RAX_AUTH=1
export OS_PASSWORD=89b15a9564b64302bdaf4f3e9960e797
export OS_PROJECT_ID=738614
export OS_NO_CACHE=1