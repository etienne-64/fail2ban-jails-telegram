# Installation on Debian 11.3

I assume:
- your run linux Debian
- the default jail configuration is defaults-debian.conf (in /etc/fail2ban/jail.d)

## Clone repository
```bash
$ sudo -i
# cd /opt/ 
# git clone https://github.com/etienne-64/fail2ban-jails-telegram.git
```
## Create your bot
[Tuto on sendpluse.com](https://sendpulse.com/knowledge-base/chatbot/create-telegram-chatbot) . 
Read the part : "**How to Create a New Bot for Telegram**"

If you forgot your id:
- go totelegram and select **@userinfobot** (find in the Search bar)
- in message area, write "**/start**"
- you get id, first name and languade

## Prepare script
In the folder you clone (/opt/fail2ban-jails-telegram)
```bash
# echo "your telegram id" > telegram.id         # echo "331640851" > telegram.id 
# echo "your telegram key" > telegram.key       # echo "900081109:AA67e8kZe77ghj7i5fwb7H_UJBuuuuuykE4" > telegram.key



# chmod +x install.sh
# ./install.sh
 
```
