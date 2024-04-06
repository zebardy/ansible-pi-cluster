#!/bin/bash
tmux new-session -s kubernetes -n vim -d
tmux new-window -t kubernetes -d -n status
tmux send-keys "sudo dmesg -T -w" C-m
tmux split-window -v -t kubernetes -d
tmux select-pane -t 1
tmux send-keys "htop" C-m
tmux split-window -v -t kubernetes -d
tmux select-pane -t 2
tmux send-keys "watch -n 10 \"sudo crictl --runtime-endpoint unix:///run/containerd/containerd.sock ps -a | head -n 13\"" C-m
tmux select-pane -t 0
tmux split-window -v -t kubernetes -d
tmux select-pane -t 1
tmux send-keys 'watch -n 10 "for dev in \$(ls -1rt /dev/sd*); do echo \"\$dev - \$(sudo hwinfo --block --only \$dev | grep pvc | tr \",\" \"\n\" | grep pvc | cut -d ':' -f 3)\"; done"' C-m
tmux split-window -h -t kubernetes -d
tmux select-pane -t 2
tmux attach-session -d -t kubernetes

