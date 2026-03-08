if command -v uv &> /dev/null; then
    eval "$(uv generate-shell-completion zsh)"
fi
if command -v uvx &> /dev/null; then
    eval "$(uvx --generate-shell-completion zsh)"
fi
