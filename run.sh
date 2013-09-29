#!/bin/sh
var1="date"
var2="watch sensors"
var3="tail -f /var/log/syslog"

tmux new-session -d -s SysWatch 'exec sys'

tmux send-keys "$var1" 'C-m'

tmux select-window -t SysWatch:0
tmux rename-window 'SYS'

tmux split-window -h #'exec sys'

tmux send-keys "$var2" 'C-m'
tmux split-window -v -t 0 #'exec sys'

tmux send-keys "$var3" 'C-m'
tmux split-window -v -t 1 #'exec sys'

tmux -2 attach-session -t SysWatch
