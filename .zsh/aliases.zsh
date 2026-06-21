function _set_git_aliases() {
  alias g='git'
  alias ga='git add'
  alias gaa='git add --all'
  alias gb='git branch'
  alias gc='git commit -v'
  alias gcmsg='git commit -m'
  alias gco='git checkout'
  alias gd='git diff'
  alias gl='git pull'
  alias glog='git log --oneline --decorate --graph'
  alias gp='git push'
  alias gst='git status'
  alias gsw='git switch'
}

function _set_general_aliases() {
  if ls --color -d . &>/dev/null; then
    alias ls='ls --color=tty'
  elif ls -G -d . &>/dev/null; then
    alias ls='ls -G'
  fi

  alias ll='ls -lh'
  alias la='ls -lAh'
  alias l='ls -CF'
  alias ..='cd ..'
  alias ...='cd ../..'
  alias -- -='cd -'
  alias md='mkdir -p'
  alias rd='rmdir'
  alias _='sudo '
  alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
  alias egrep='command grep -E --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
  alias fgrep='command grep -F --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
}

function set_aliases() {
  _set_git_aliases
  _set_general_aliases
}
