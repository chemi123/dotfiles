# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

function load_zsh_config() {
  if [[ -f "$1" ]]; then
    source "$1"
  else
    echo "warning: $1 not found ($2 is not available)" >&2
  fi
}

function main() {
  load_zsh_config ~/.powerlevel10k/powerlevel10k.zsh-theme "prompt theme"

  load_zsh_config ~/.zsh/options.zsh "history, directory options"
  load_zsh_config ~/.zsh/completion.zsh "tab completion"
  load_zsh_config ~/.zsh/aliases.zsh "git, general aliases"
  load_zsh_config ~/.zsh/key-bindings.zsh "key bindings"
  load_zsh_config ~/.local_zsh_customization "local customization"
  load_zsh_config ~/.p10k.zsh "prompt customization"

  set_history
  set_completion
  set_aliases
  set_directory_options
  set_general_options
  set_key_bindings
}

main
