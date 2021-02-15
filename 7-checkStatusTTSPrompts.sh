#!/bin/bash
. cfg.sh
#
var=${1:?You have to provide an EDB text filename with no spaces as an argument}
#
# Storing the JSON file containing the speaker ID into a variable
speaker_json=`ls -1 *.json`
#

while IFS= read -r line
	do
		# Extract audio filename from EDB file
		prompt_audio=`echo $line|cut -f1 -d:` &&
		# Extract audio basename to be used as the TTS prompt name
		prompt_name=$(basename "$prompt_audio" .wav) &&
		# Extract Speaker Model ID from JSON file
    speakerID=`grep "speaker_id" $speaker_json|cut -f4 -d'"'` &&
		echo "Checking status from prompt " $prompt_name " ............." &&
		curl -X GET -u $useCred "$url/v1/customizations/$customID/prompts/$prompt_name"

	done < "$1"
