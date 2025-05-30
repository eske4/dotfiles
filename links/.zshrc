# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

HISTFILE=~/.zsh_history

# source
plug "$HOME/dotfiles/links/.config/zsh/aliases.zsh"
plug "$HOME/dotfiles/links/.config/zsh/exports.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "esc/conda-zsh-completion"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "MichaelAquilina/zsh-you-should-use"
plug "hlissner/zsh-autopair"
plug "zsh-users/zsh-syntax-highlighting"
plug "Aloxaf/fzf-tab"
plug "zsh-users/zsh-history-substring-search"
plug "zap-zsh/vim"
plug "zap-zsh/fzf"
plug "zap-zsh/exa"
plug "leophys/zsh-plugin-fzf-finder"

# Load and initialise completion system
autoload -Uz compinit

eval "$(starship init zsh)"
