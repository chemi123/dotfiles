# set prefix mode keybind to ctrl-t
set-option -g prefix C-t
unbind-key C-b
bind-key C-t send-prefix

set-option -g set-clipboard on

set-option -g default-terminal "tmux-256color"
set-option -sa terminal-overrides ",xterm-256color:Tc"

setw -g mode-keys vi

bind-key e run-shell 'n=$(tmux list-panes | wc -l); while [ $n -lt 3 ]; do tmux split-window -h -c "#{pane_current_path}"; n=$((n+1)); done; tmux select-layout even-horizontal'
