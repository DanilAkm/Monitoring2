#!/bin/bash

check() {
    if ! [[ $1 =~ ^[0-9]+$ ]]; then
        echo "invalid parameter"
        exit
    else
        if [[ $1 -le 0 || $1 -ge 5 ]]; then
            echo "invalid parameter range (1-4)"
            exit
        fi
    fi
}