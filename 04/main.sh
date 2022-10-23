#!/bin/bash

. ./gen_data.sh

sudo rm *log*

rand1=$((100 + $RANDOM % 1000))

for ((j = 1 ; j < 6; j++));
do

    for ((i = 0 ; i < $rand1; i++));
    do
        printf "$(gen_ip) - - [$(gen_date "$(date --date="$j day" +'%d/%h/%Y')")] \"$(gen_method) $(gen_http_req)\" $(gen_response) $(gen_bytes) \"$(gen_request)\" \"$(gen_agent)\"\n" >> "log$j.log"
    done
    srtedprint=$(cat "log$j.log" | sort -k4)
    echo "$srtedprint" > "log$j.log"
done

    #       200 - OK:
    #           The request has succeeded

    #       201 - Created:
    #           The request has been fulfilled and resulted in a new resource being created

    #       400 - Bad Request:
    #           The request could not be understood by the server due to malformed syntax

    #       401 - Unauthorized:
    #           The request requires user authentication    

    #       403 - Forbidden:
    #           The server understood the request, but is refusing to fulfill it

    #       404 - Not Found:
    #           The server has not found anything matching the Request-URI

    #       500 - Internal Server Error:
    #           The server encountered an unexpected condition 
    #           which prevented it from fulfilling the request

    #       501 - Not Implemented:
    #           The server does not support the functionality required to fulfill the request

    #       502 - Bad Gateway:
    #           The server, while acting as a gateway or proxy,
    #           received an invalid response from the upstream 
    #           server it accessed in attempting to fulfill the request

    #       503 - Service Unavailable:
    #           The server is currently unable to handle the request 
    #           due to a temporary overloading or maintenance of the server