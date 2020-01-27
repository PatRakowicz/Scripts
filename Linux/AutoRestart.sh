#!/bin/sh
screen -S minecraft -p 0 -X stuff "`printf "stop\r"`";
sleep 5
screen -S minecraft -p 0 -X stuff "`printf "./ServerStart.sh\r"`";
