#!/bin/bash

. ./check.sh
. ./print.sh

if [ $# == 1 ]; then
    check $1
else
    echo "invalid number of parameters"
    exit
fi

if [[ $1 == 1 ]]; then
    sort_by_response
fi
if [[ $1 == 2 ]]; then
    print_unique_ips_only
fi
if [[ $1 == 3 ]]; then
    print_error_requests_only
fi
if [[ $1 == 4 ]]; then
    print_unique_ips_in_err_only
fi
