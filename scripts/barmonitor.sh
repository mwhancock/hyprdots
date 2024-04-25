   1   │ #!/bin/bash
   2   │ # Kill and restart waybar whenever its config files change
   3   │
   4   │ CONFIG_FILES="$HOME/.config/waybar/config.jsonc $HOME/.config/waybar/style.css"
   5   │
   6   │ trap "killall waybar" EXIT
   7   │
   8   │ while true; do
   9   │     logger -i "$0: Starting waybar in the background..."
  10   │     waybar &
  11   │     logger -i "$0: Started waybar PID=$!. Waiting for modifications to ${CONFIG_FILES}..."
  12   │     inotifywait -e modify ${CONFIG_FILES} 2>&1 | logger -i
  13   │     logger -i "$0: inotifywait returned $?. Killing all waybar processes..."
  14   │     killall waybar 2>&1 | logger -i
  15   │     logger -i "$0: killall waybar returned $?, wait a sec..."
  16   │     sleep 1
  17   │ done
