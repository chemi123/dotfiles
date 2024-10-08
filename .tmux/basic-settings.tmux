# set prefix mode keybind to ctrl-t
set-option -g prefix C-t
unbind-key C-b
bind-key C-t send-prefix

setw -g mode-keys vi
