#!/bin/bash

sort_by_response() {
    sort -k8 ../04/log*.log
}

print_unique_ips_only() {
    awk '{ print $1 }' ../04/log*.log | uniq
}

print_error_requests_only() {
    awk -e '$8 ~ /4..|5../ {print $0}' ../04/log1.log
}

print_unique_ips_in_err_only() {
    print_error_requests_only | awk '{ print $1 }' | uniq
}