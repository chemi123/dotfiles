function set_key_bindings() {
  bindkey -e

  # Up/Down - incremental history search with current input
  autoload -U up-line-or-beginning-search down-line-or-beginning-search
  zle -N up-line-or-beginning-search
  zle -N down-line-or-beginning-search
  [[ -n "${terminfo[kcuu1]}" ]] && bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
  [[ -n "${terminfo[kcud1]}" ]] && bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

  # Home/End
  [[ -n "${terminfo[khome]}" ]] && bindkey "${terminfo[khome]}" beginning-of-line
  [[ -n "${terminfo[kend]}" ]]  && bindkey "${terminfo[kend]}"  end-of-line

  # Delete
  [[ -n "${terminfo[kdch1]}" ]] && bindkey "${terminfo[kdch1]}" delete-char

  # Ctrl+Left/Right - word movement
  bindkey '^[[1;5C' forward-word
  bindkey '^[[1;5D' backward-word

  # Shift-Tab - reverse completion
  [[ -n "${terminfo[kcbt]}" ]] && bindkey "${terminfo[kcbt]}" reverse-menu-complete

  # Ctrl-x Ctrl-e - edit command in $EDITOR
  autoload -U edit-command-line
  zle -N edit-command-line
  bindkey '\C-x\C-e' edit-command-line
}
