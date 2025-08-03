#!/bin/sh

DUNST_EXEC="dunst -config ~/.config/hypr/dunst/dunstrc"
PID_FILE="/tmp/dunst.pid"

case "$1" in
    start)
        echo "Starting dunst..."
        if pgrep -x "dunst" > /dev/null; then
            echo "dunst is already running."
        else
            nohup "$DUNST_EXEC" &
            echo $! > "$PID_FILE"
            echo "dunst started."
        fi
        ;;
    stop)
        echo "Stopping dunst..."
        if [ -f "$PID_FILE" ]; then
            PID=$(cat "$PID_FILE")
            if ps -p $PID > /dev/null; then
                kill $PID
                rm "$PID_FILE"
                echo "dunst stopped."
            else
                echo "dunst not running (PID file exists but process not found). Removing stale PID file."
                rm "$PID_FILE"
            fi
        elif pgrep -x "dunst" > /dev/null; then
            pkill -x "dunst"
            echo "dunst stopped (killed via pkill)."
        else
            echo "dunst is not running."
        fi
        ;;
    restart)
        echo "Restarting dunst..."
        "$0" stop
        sleep 1
        "$0" start
        ;;
    status)
        if pgrep -x "dunst" > /dev/null; then
            echo "dunst is running."
        else
            echo "dunst is not running."
        fi
        ;;
    toggle)
        echo "Toggling dunst..."
        if pgrep -x "dunst" > /dev/null; then
            "$0" stop
            notify-send "Dunst Notifications" "Notifications OFF"
        else
            "$0" start
            notify-send "Dunst Notifications" "Notifications ON"
        fi
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status|toggle}"
        exit 1
        ;;
esac

exit 0
