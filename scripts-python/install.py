#!/usr/bin/env python3

import argparse

# Get input choice
parser = argparse.ArgumentParser()
parser.add_argument("--python", help="Choose python script", action="store_true")
args = parser.parse_args()

# Select shell or python script
if args.python:
    print("Python")
else:
    print('Bash')
