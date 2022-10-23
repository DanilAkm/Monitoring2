#!/bin/bash

codes=(200 201 400 401 403 404 500 501 502 503)
methods=("GET" "POST" "PUT" "PATCH" "DELETE")
agents=("Mozilla" "Google Chrome" "Opera" "Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")
requests=("work" "school" "project" "state")
signs=("sign-in" "sign-out")
http_reqs=("/gachi.html HTTP/2.0" "/git.html /HTTP 1.1" "/push.html /HTTP 1.0" "/origin.html /HTTP 0.9" "/develop.html /HTTP 1.1")

gen_ip() {
    rawip=$(printf "%d.%d.%d.%d\n" "$((RANDOM % 256))" "$((RANDOM % 256))" "$((RANDOM % 256))" "$((RANDOM % 256))")
    printf "%-15s" $rawip
}

gen_response() {
    printf "%s\n" ${codes[@]} | shuf | head -1
}

gen_method() {
    printf "%s\n" ${methods[@]} | shuf | head -1
}

gen_date() {
    printf "$1:%02d:%02d:%02d $(timedatectl | grep "Time zone" | cut -d',' -f2 | cut -d' ' -f2 | cut -d')' -f1)\n" "$((RANDOM % 24))" "$((RANDOM % 60))" "$((RANDOM % 60))"
}

gen_request() {
    req=$(printf "%s\n" ${requests[@]} | shuf | head -1)
    sig=$(printf "%s\n" ${signs[@]} | shuf | head -1)
    outstr="https://"$req"/"$sig""
    printf "%s" $outstr
}

gen_agent() {
    rand_agent=$((0 + $RANDOM % 8))
    echo ${agents[rand_agent]}
}

gen_http_req() {
    rand_req=$((0 + $RANDOM % 5))
    printf "%s" ${http_reqs[rand_req]}
}

gen_bytes() {
    rand_bytes=$((0 + $RANDOM % 1248971))
    echo $rand_bytes
}