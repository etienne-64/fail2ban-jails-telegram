#!/usr/bin/env python3

import subprocess
from datetime import datetime
from socket import gethostname
import requests
import argparse

def send_to_telegram(message):
    # Get Telegram id & key
    id = subprocess.run('cat telegram.id', shell=True, capture_output=True).stdout.decode('utf-8')
    key = subprocess.run('cat telegram.key', shell=True, capture_output=True).stdout.decode('utf-8')
    # Get & format current date
    now = datetime.now().strftime("%d/%m/%Y %H:%M")
    url = f"https://api.telegram.org/bot{key}/sendMessage"

    hostname = gethostname()

    message = f"Origine: {now} - {hostname} \n {message}"

    data = {'chat_id': id , 'text': message, 'disable_web_preview': 'true', 'parse_mode':'markdown'}

    req = requests.post(url, data=data)

if __name__ == "__main__":

    # Get input choice
    parser = argparse.ArgumentParser()
    parser.add_argument("-m","--message", help="Message to be sent", required=True)
    args = parser.parse_args()
    message = args.message

    try:
        send_to_telegram(message)

    except Exception as err:
        print(f"Erreur: {err}")