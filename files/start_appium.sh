#!/usr/bin/env bash

source ~/.bash_profile

function startAppium() {
    if [[ $appium_version == "1."* ]]; then  
        appium -p $1 --relaxed-security --log-timestamp --local-timezone >> ~/appium_server_logs/appium_$1.log 2>&1 &
        echo "`date` Restart appium -p $1 --relaxed-security --log-timestamp --local-timezone" >> ~/appium_server_logs/start_server_stdout.log 2>&1
    elif [[ $appium_version == "2."* ]]; then
        appium -p $1 --relaxed-security --log-timestamp --local-timezone --base-path /wd/hub --use-plugins=relaxed-caps,images >> ~/appium_server_logs/appium_$1.log 2>&1 &
        echo "`date` Restart appium -p $1 --allow-insecure get_server_logs --log-timestamp --local-timezone --base-path /wd/hub --use-plugins=relaxed-caps,images" >> ~/appium_server_logs/start_server_stdout.log
    else 
        echo "`date` Restart No appium be found" >> ~/appium_server_logs/start_server_stdout.log 2>&1
    fi
}

function stopAppium() {
    pids=`ps -ef | grep appium | grep -v grep | awk '{{print $2}}'`
    for pid in $pids
    do
        kill -9 $pid
    done
}

function run() {
    mkdir -p ~/appium_server_logs
    appium_version=$(appium --version)
    stopAppium
    echo "`date` [Reoot] Stop all appiums" >> ~/appium_server_logs/start_server_stdout.log
    startAppium 4723
    startAppium 4724
    echo >> ~/appium_server_logs/start_server_stdout.log
}

run