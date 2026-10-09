#!/bin/bash
ROFI_THEME="$HOME/.config/rofi/powermenu.rasi"
ROFI_CMD=(rofi -dmenu -i -hover-select -show-icons -theme "$ROFI_THEME" -icon-theme Papirus-Dark)

confirm() {
  ANS=$(printf 'Yes\0icon\x1fcheckmark\nNo\0icon\x1fdialog-error\n' | "${ROFI_CMD[@]}" \
        -theme-str 'window { width: 400px; } listview { columns: 2; }' \
        -p "  Sure to $1?")
  [[ "$ANS" == "Yes" ]] && return 0 || exit 0
}

CHOICE=$(printf 'Shutdown\0icon\x1fsystem-shutdown\nReboot\0icon\x1fsystem-reboot\nSuspend\0icon\x1fsystem-suspend\nHibernate\0icon\x1fsystem-suspend-hibernate\nLock\0icon\x1fsystem-lock-screen\nLogout\0icon\x1fsystem-log-out\n' | "${ROFI_CMD[@]}" -p "  Power Menu")

case "$CHOICE" in
  Shutdown)  confirm "Shutdown" && systemctl poweroff ;;
  Reboot)    confirm "Reboot" && systemctl reboot ;;
  Suspend)   confirm "Suspend" && systemctl suspend ;;
  Hibernate) confirm "Hibernate" && systemctl hibernate ;;
  Lock)      i3lock -c 282a36 -n --clock --indicator ;;
  Logout)    confirm "Logout" && openbox --exit ;;
esac
