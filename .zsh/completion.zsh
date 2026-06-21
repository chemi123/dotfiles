function set_completion() {
  autoload -Uz compinit && compinit
  autoload -U +X bashcompinit && bashcompinit

  zmodload -i zsh/complist

  setopt auto_menu
  setopt complete_in_word
  setopt always_to_end
  unsetopt menu_complete
  unsetopt flowcontrol

  zstyle ':completion:*:*:*:*:*' menu select
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
  zstyle ':completion:*' special-dirs true
  zstyle ':completion:*' list-colors ''
  zstyle ':completion:*' use-cache yes
  zstyle ':completion:*' cache-path ~/.zsh_cache

  if command -v docker &>/dev/null; then
    eval "$(docker completion zsh 2>/dev/null)"
  fi
}
