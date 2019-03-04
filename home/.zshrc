############################ Oh-My-ZSH Configuration
export ZSH=${ZDOTDIR:-$HOME}/.oh-my-zsh
ZSH_THEME="lukerandall"
COMPLETION_WAITING_DOTS="true"
ENABLE_CORRECTION="true"
plugins=(git python pip sudo docker kubectl aws brew)
source $ZSH/oh-my-zsh.sh


############################ Personal Configuration

# Load Local Environment Variables
if [ -f "${ZDOTDIR:-$HOME}/.environment" ]; then
    source "${ZDOTDIR:-$HOME}/.environment"
fi

# Load Aliases
source "${ZDOTDIR:-$HOME}/.aliases"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

# Update Path
PATH=./node_modules/.bin:$PATH  # Local node modules, relative to directory
PATH=~/go/bin:$PATH # GO path

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
if [ -d "$HOME/.rvm" ]; then
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
    PATH="$PATH:$HOME/.rvm/bin"
    export RUBYGEMS_GEMDEPS=-  # Save us from bundle exec
 fi

# Set up kubectl
# Create ~/.kube/config/ if it does not exist. Add every file with
# `kubeconfig` in the name (e.g. prod.kubeconfig) to the
# $KUBECONFIG env var for kubectl to digest
if [ ! -d "$HOME/.kube/config" ]; then
    mkdir -p $HOME/.kube/config
fi
for f in `ls ~/.kube/config/ | grep kubeconfig`; do
    export KUBECONFIG="$HOME/.kube/config/$f:$KUBECONFIG";
done

