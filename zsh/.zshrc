zmodload zsh/zprof
export ZSH="$HOME/.config/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# User configuration

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias -g l="eza"
alias -g ll="eza -l"
alias -g lll="eza -la"
alias v="nvim"
function fg-bg {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER=fg
        zle accept-line
    else
        zle push-input
    fi
}
zle -N fg-bg
bindkey "" fg-bg
session-widget() { tmux-sessionizer }
zle -N session-widget
bindkey ^f session-widget

set -o vi
export PATH=$PATH:/usr/local/go/bin:$HOME/.config/bin:$HOME/.local/bin
export EDITOR="nvim"
source ~/.zsh_profile
source ~/.fzf.zsh
eval "$(~/.local/bin/mise activate zsh)"
export RESTIC_REPOSITORY=/media/backup
alias resticbackup="restic backup ~/ --exclude-file=/home/keslol/.config/restic/exclude.txt"
zprof
