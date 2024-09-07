# Export paths
export PATH="$PATH:$HOME/.local/bin"
export ZSH="$HOME/.oh-my-zsh"

# Zsh History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Add Oh My Zsh plugins
plugins=(
  eza
  brew
  ssh-agent
  web-search
  zoxide
  starship
  zsh-autosuggestions # Requires seperate install
  copypath
  copyfile
  fzf
  you-should-use # Requires seperate install
  aliases
  colored-man-pages
  tmux
  zsh-syntax-highlighting # Requires seperate install
)

# Configure tmux
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=true
ZSH_TMUX_AUTOQUIT=false
ZSH_TMUX_DEFAULT_SESSION_NAME="main"

# Configure eza
zstyle ':omz:plugins:eza' dirs-first 'yes'
zstyle ':omz:plugins:eza' git-status 'yes'
zstyle ':omz:plugins:eza' header 'no'
zstyle ':omz:plugins:eza' show-group 'no'
zstyle ':omz:plugins:eza' time-style 'long-iso'
zstyle ':omz:plugins:eza' icons 'yes'

# Configure ssh-agent
zstyle ':omz:plugins:ssh-agent' agent-forwarding 'yes'

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Custom aliases
alias c='clear'
alias cat='bat -p'
alias can='bat'
alias lg='lazygit'
alias n='clear ; neofetch'
alias music='psql -h 192.168.0.140 -U talon-likeaclaw -d music_db'
alias or='nvim ~/documents/obsidian/talons-brain/inbox/*.md'
alias size="du -sh"
alias td='tmux detach'
alias tn='tmux new-session -s '
alias ta='tmux attach -t '
alias tl='tmux list-sessions'
alias tk='tmux kill-session -t '
alias v='neovide'
alias r='ranger'
alias obs='export QT_QPA_PLATFORM=xcb && obs'

# Intialize tools
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Clear screen and run neofetch at the end
clear
neofetch
