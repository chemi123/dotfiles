# set prefix mode keybind to ctrl-t
set-option -g prefix C-t
unbind-key C-b
bind-key C-t send-prefix

set-option -g set-clipboard on

set-option -ga terminal-overrides ",xterm-256color:Tc"

set-option -sg escape-time 0

setw -g mode-keys vi
