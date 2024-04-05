DATE=$(date)
IP=$(ip addr show wlan0 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)
WHO=$(whoami)
PWR=$(cat /sys/class/power_supply/BAT0/capacity)
STA=$(cat /sys/class/power_supply/BAT0/status)

echo "${PWR}% ${STA} :: ${WHO} :: ${IP} :: ${DATE}"
