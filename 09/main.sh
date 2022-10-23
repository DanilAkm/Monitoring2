#!/bin/bash

rm metrics*

/home/boy/exporter/create_stats.sh > /home/boy/exporter/metrics.html
/home/boy/exporter/create_stats.sh > /home/boy/exporter/metrics
