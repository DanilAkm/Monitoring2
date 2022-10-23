#!/bin/bash

zcat -f ../04/log*.log > ../04/combined.log

goaccess \
  --log-file=../04/combined.log \
  --log-format=COMBINED \
  --exclude-ip=0.0.0.0 \
  --ignore-crawlers \
  --real-os \
  --output=./logs.html