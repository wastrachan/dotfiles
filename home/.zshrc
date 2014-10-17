# Path to your oh-my-zsh installation.
export ZSH=${ZDOTDIR:-$HOME}/.oh-my-zsh

# Select Theme
ZSH_THEME="lukerandall"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


# Oh-My-ZSH Plugins
plugins=(brew django fabric gem git knife python sudo)

source $ZSH/oh-my-zsh.sh


############################


# Personal Configuration

# Load Aliases
source "${ZDOTDIR:-$HOME}/.aliases"


# Update Paths
export PATH=$HOME/bin:/usr/local/bin:$PATH
# PATH=$PATH:$HOME/.rvm/bin
# PATH=$PATH:./node_modules/.bin
PATH=$PATH:/opt/android-sdk-macosx/ant/bin:/opt/android-sdk-macosx/platform-tools:/opt/android-sdk-macosx/tools

# Stop that awful error when compiling
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

# Phobio-Related stuff
export PHOBIO_TRANSLATIONS_PATH="/Users/rew1red/Dropbox/Phobio/Phobio Translations"


# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
