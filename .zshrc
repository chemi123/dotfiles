# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

function load_zsh_config() {
  [[ -f "$1" ]] && source "$1"
}

function main() {
  load_zsh_config ~/.powerlevel10k/powerlevel10k.zsh-theme

  load_zsh_config ~/.zsh/options.zsh
  load_zsh_config ~/.zsh/completion.zsh
  load_zsh_config ~/.zsh/aliases.zsh
  load_zsh_config ~/.zsh/key-bindings.zsh
  load_zsh_config ~/.local_zsh_customization
  load_zsh_config ~/.p10k.zsh

  set_history
  set_completion
  set_aliases
  set_directory_options
  set_general_options
  set_key_bindings
}

main
