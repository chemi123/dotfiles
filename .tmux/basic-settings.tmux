# set prefix mode keybind to ctrl-t
set-option -g prefix C-t
unbind-key C-b
bind-key C-t send-prefix

set-option -g set-clipboard on

set-option -g default-terminal "tmux-256color"
set-option -sa terminal-overrides ",xterm-256color:Tc"

setw -g mode-keys vi

bind-key E split-window -h \; split-window -h \; select-layout even-horizontal
