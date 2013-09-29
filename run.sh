#!/bin/sh

tmux new-session -d -s SysWatch 'exec sys'

tmux send-keys 'date' 'C-m'

tmux select-window -t SysWatch:0
tmux rename-window 'SYS'

tmux split-window -h #'exec sys'

tmux send-keys 'watch sensors' 'C-m'
tmux split-window -v -t 0 #'exec sys'

tmux send-keys 'tail -f /var/log/syslog' 'C-m'
tmux split-window -v -t 1 #'exec sys'

tmux -2 attach-session -t SysWatch
