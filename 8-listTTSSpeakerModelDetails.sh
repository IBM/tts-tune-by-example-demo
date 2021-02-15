#!/bin/bash
. cfg.sh
#
# Storing the JSON file containing the speaker ID into a variable
speaker_json=`ls -1 *.json`
#

# Extract speaker ID basename from JSON filename
speaker_bname=$(basename "$speaker_json" .json)
# Extract Speaker Model ID from JSON file
speakerID=`grep "speaker_id" $speaker_json|cut -f4 -d'"'`
echo "Getting details from speaker id " $speakerID " and storing the into " $speaker_bname-details.txt "............."
curl -X GET -u $useCred "$url/v1/speakers/$speakerID" > $speaker_bname-details.txt
