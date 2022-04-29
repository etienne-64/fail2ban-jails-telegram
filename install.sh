#!/usr/bin/env bash

DATE_STAMP=$(date +"%y%m%d.%H%M")

# === Differents paths ===
SCRIPT_DIR=$(pwd)

FAIL2BAN_PATH='/etc/fail2ban'
FAIL2BAN_ACTION_PATH=$FAIL2BAN_PATH/'action.d'
FAIL2BAN_JAIL_PATH=$FAIL2BAN_PATH/'jail.d'
FAIL2BAN_SCRIPT_PATH=$FAIL2BAN_PATH/'script.d'

# More parameters later :


# === SET telegram.conf ===
cd $FAIL2BAN_ACTION_PATH
if [[ -f telegram.conf ]]; then
  # Backup current version
  mv telegram.conf telegram.conf.$DATE_STAMP.bkp
fi
cd $SCRIPT_DIR
cp telegram.conf $FAIL2BAN_ACTION_PATH

# === SET script-helper ===
if [[ ! -d $FAIL2BAN_SCRIPT_PATH ]]; then
  mkdir $FAIL2BAN_SCRIPT_PATH
fi

cd $FAIL2BAN_SCRIPT_PATH]

if [[ -f telegram-helper.sh ]]; then
  # Backup current version
  mv telegram-helper.sh telegram-helper.sh.$DATE_STAMP.bkp
fi

cd $SCRIPT_DIR

cp telegram-helper.sh $FAIL2BAN_SCRIPT_PATH
cp telegram.id $FAIL2BAN_SCRIPT_PATH
cp telegram.key $FAIL2BAN_SCRIPT_PATH

chmod +x telegram-helper.sh

cd $FAIL2BAN_JAIL_PATH

if [[ -f defaults-debian.conf ]]; then
  # Backup current version
  mv defaults-debian.conf defaults-debian.conf.$DATE_STAMP.bkp
fi

cd $SCRIPT_DIR

cp  defaults-debian.conf $FAIL2BAN_JAIL_PATH

echo "Finished !"

