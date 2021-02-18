#!/bin/bash
. cfg.sh
var=${1:?You have to provide an JSON filename with no spaces as the 2nd argument}
#
# Storing the JSON file containing the speaker ID into a variable
speaker_json=$1
#
# Extract Speaker Model ID from JSON file
speakerID=`grep "speaker_id" $speaker_json|cut -f4 -d'"'`
echo "Deleting speaker id for" $speaker_json " ............."
curl -X DELETE -u $useCred "$url/v1/speakers/$speakerID"
rm $speaker_json
