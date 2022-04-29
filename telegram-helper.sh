#!/usr/bin/env bash

echo $# $1 $2

ID=$(cat telegram.id)
KEY=$(cat telegram.key)


function send {
  URL="https://api.telegram.org/bot$KEY/sendMessage"
  DATE=$(date +"%d/%m/%y %H%M")

  SRV_HOSTNAME=$(hostname -f)
  SRV_IP=$(hostname -I | awk '{print $1}')
  TEXT="${DATE}  - $SRV_HOSTNAME
  $1"

  curl -s -d "chat_id=$ID&text=${TEXT}&disable_web_page_preview=true&parse_mode=markdown" $URL > /dev/null
}

if [[ $# < 1 ]]; then
  exit
fi

case $1 in
  start)
        message="The+jail+'$2'+has+been+started+successfully."
        send $message;;
  stop)
        message="The+jail+'$2'+has+been+stopped+successfully."
        send $message;;
  check)
        ;;
  ban)
        message="[$2](https://ipinfo.io/$2)+as+been+banned+after+$3+attemps."
        send $message;;
  unban)
        message="$2+as+been+unbanned."
        send $message;;
  *)
        ;;
esac
