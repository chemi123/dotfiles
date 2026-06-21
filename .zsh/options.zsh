function set_history() {
  HISTFILE=~/.zsh_history
  HISTSIZE=50000
  SAVEHIST=10000
  setopt share_history
  setopt extended_history
  setopt hist_ignore_dups
  setopt hist_expire_dups_first
  setopt hist_ignore_space
  setopt hist_verify
}

function set_directory_options() {
  setopt auto_pushd
  setopt pushd_ignore_dups
  setopt pushdminus
}

function set_general_options() {
  setopt interactivecomments
}

function d() {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -n 10
  fi
}
