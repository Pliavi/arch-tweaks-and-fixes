#!/bin/sh
echo "=========================================="
echo "| FILE WATCHER FIXER                     |"
echo "=========================================="
echo "| Fix file notifiers not being updated   |" 
echo "| even if set in 40-max-user-watchers    |"
echo "=========================================="

echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/40-max-user-watches.conf
echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/50-max_user_watches.conf
sudo sysctl --system

echo "Done! Try now, if it's not working yet, try restart your computer"