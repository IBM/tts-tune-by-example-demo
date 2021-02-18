#!/bin/bash
. cfg.sh
#
var=${1:?You have to provide a JSON filename with no spaces as the argument}
#
# Storing the JSON file containing the speaker ID into a variable
speaker_json=$1

# Extract speaker ID basename from JSON filename
speaker_bname=$(basename "$speaker_json" .json)
# Extract Speaker Model ID from JSON file
speakerID=`grep "speaker_id" $speaker_json|cut -f4 -d'"'`
echo "Getting details from speaker id " $speakerID " and storing the into " $speaker_bname-details.txt "............."
curl -X GET -u $useCred "$url/v1/speakers/$speakerID" > $speaker_bname-details.txt
