#!/bin/bash
WLANDB_FOLDER="/home/pi/workspace/wlandb/"
WIFISCAN_FOLDER="/home/pi/workspace/wifiscan/"

cd $WLANDB_FOLDER

source virtenv/bin/activate

for filename in $WIFISCAN_FOLDER/scan-[0-9]*.csv; do
    python wlandb.py $filename
    rm $filename
done

deactivate #virtualenv
