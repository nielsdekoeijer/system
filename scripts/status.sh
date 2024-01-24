DATE=$(date)
IP=$(ip addr show wlan0 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)
WHO=$(whoami)


echo "${WHO} :: ${IP} :: ${DATE}"
