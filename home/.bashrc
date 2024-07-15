# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
export PATH="$PATH:/home/KlintoE/.dotnet/tools"
export PATH="$PATH:/usr/share/dotnet"
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
export TERM=xterm-256color
export PATH="$PATH:$HOME/.tmux/plugins/tmuxifier/bin"
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"
export EDITOR=nvim
