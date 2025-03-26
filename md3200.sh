#!/bin/bash

server=10.150.100.50
smcli=/opt/dell/mdstoragemanager/client/SMcli

while getopts ":dpfbt" opt
    do
        case $opt in

            # Check drive
            d) declare array
               # Remove unneccessary or add additional conditions if needed.
                       drive=`$smcli $server -c "show allPhysicalDisks summary;" | grep '\(failure\|Failed\)' | wc -l`
                       if [[ $drive -ge 1 ]];
                           then
                               echo $drive
                           else
                               echo 0
                       fi
            ;;

            # Check PSU
            p) declare array
                       psu=`$smcli $server -c "show storageArray;" | grep "Power supply status" | grep Failed | wc -l`
                       if [[ $psu -ge 1 ]]
                           then
                               echo $psu
                           else
                               echo 0
                       fi
            ;;

            # Check FAN
            f) declare array
                       fan=`$smcli $server -c "show storageArray;" | grep "Fan Status" | grep Failed | wc -l`
                       if [[ $fan -ge 1 ]]
                           then
                               echo $fan
                           else
                               echo 0
                       fi
            ;;

            # Check Battery
            b) declare array
                       bat=`$smcli $server -c "show storageArray;" | grep "Battery status" | grep Failed | wc -l`
                       if [[ $bat -ge 1 ]]
                           then
                               echo $bat
                           else
                               echo 0
                       fi
            ;;

            # Check Temperature
            t) declare array
                       tmp=`$smcli $server -c "show storageArray;" | grep "Temperature sensor status" | grep -v Optimal | wc -l`
                       if [[ $tmp -ge 1 ]]
                           then
                               echo $tmp
                           else
                               echo 0
                       fi
            ;;

        esac
    done
