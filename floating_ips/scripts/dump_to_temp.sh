#!/usr/bin/env bash

log_msg=${log_message}

ctx logger info "Writing log messsage ${log_msg} to /tmp/test_log.txt"

echo ${log_msg} >> /tmp/test_log.txt
