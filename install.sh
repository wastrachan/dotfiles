#! /bin/zsh

homedir="${ZDOTDIR:-$HOME}"
rcdir="${homedir}/.zw1red"

# Git Config
if [ -f "${homedir}/.gitconfig" ]; then
    echo "${homedir}/.gitconfig already exists!"
else
    ln -s "${rcdir}/git/gitconfig" "${homedir}/.gitconfig"
fi

# Aliases file
if [ -f "${homedir}/.zaliases" ]; then
    echo "${homedir}/.zaliases already exists!"
else
    ln -s "${rcdir}/zsh/zaliases" "${homedir}/.zaliases"
fi

# Prompt
if [ -f "${homedir}/.zprezto/modules/prompt/functions/prompt_paradox_setup" ]; then
    echo "${homedir}/.zprezto/modules/prompt/functions/prompt_paradox_setup exists!"
else
    ln -s "${rcdir}/prompt/prompt_paradox_setup" "${homedir}/.zprezto/modules/prompt/functions/prompt_paradox_setup"
fi

echo "Finished linking dotfiles"
