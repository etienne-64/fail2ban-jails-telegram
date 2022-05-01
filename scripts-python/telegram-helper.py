#!/usr/bin/env python3

import subprocess
from datetime import datetime
from socket import gethostname, gethostbyname

def send_to_telegram(message):
    status = False

    # Get Telegram id & key
    id = subprocess.run('cat telegram.id', shell=True, capture_output=True).stdout.decode('utf-8')
    key = subprocess.run('cat telegram.key', shell=True, capture_output=True).stdout.decode('utf-8')
    # Get & format current date
    now = datetime.now().strftime("%d/%m/%Y %H:%M")

    hostname = gethostname()
    ip = gethostbyname(gethostname())

    message = f"{now} - {hostname} \n {message}"

    return status


if __name__ == "__main__":

    try:
        pass

    except Exception as err:
        print(f"Erreur: {err}")