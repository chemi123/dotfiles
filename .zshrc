#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

SOCK="/tmp/ssh-agent-$USER"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f $SOCK
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# autoload -U colors
#colors
#SSH_ENV="$HOME/.ssh/environment"

########################################
# 環境変数
export LANG=en_US.UTF-8
export LC_MESSAGE=en_US.UTF-8
  
# 色を使用出来るようにする
autoload -Uz colors
colors
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
  
# プロンプト
# 1行表示
# PROMPT="%~ %# "
# yroot時
PROMPT="%{${fg[cyan]}%}[%n@%m]%{${reset_color}%}$ "
  
autoload -Uz select-word-style
select-word-style default

zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified
  
########################################
autoload -Uz compinit
compinit
  
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
  
zstyle ':completion:*' ignore-parents parent pwd ..
  
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
  
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
  
  
########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
  
zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'
  
#function _update_vcs_info_msg() {
#    LANG=en_US.UTF-8 vcs_info
#    RPROMPT="${vcs_info_msg_0_}"
#}
#add-zsh-hook precmd _update_vcs_info_msg
  
  
########################################
setopt print_eight_bit
  
# beep を無効にする
setopt no_beep
  
# フローコントロールを無効にする
setopt no_flow_control
  
# '#' 以降をコメントとして扱う
setopt interactive_comments
  
# ディレクトリ名だけでcdする
setopt auto_cd
  
# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
  
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
  
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
  
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
  
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
  
# 高機能なワイルドカード展開を使用する
setopt extended_glob
  
########################################
# キーバインド
  
# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward
  
########################################
# エイリアス
  
alias la='ls -a'
alias ll='ls -l'
  
alias mkdir='mkdir -p'
  
# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '
  
# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'
  
# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi
  
  
########################################
#色の設定
export LSCOLORS=gxfxcxdxbxegedabagacad
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac

PATH=::/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin
  
# vim:set ft=zsh:
#eval "$(chef shell-init zsh)"
