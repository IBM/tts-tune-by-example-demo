#!/bin/bash
. cfg.sh
#
var=${1:?You have to provide an EDB text filename with no spaces as the 1st argument and a JSON filename with no spaces as the 2nd argument}
var=${2:?You have to provide an EDB text filename with no spaces as the 1st argument and a JSON filename with no spaces as the 2nd argument}
#
# Storing the JSON file containing the speaker ID into a variable
speaker_json=$2
#

while IFS= read -r line
	do
		# Extract audio filename from EDB file
		prompt_audio=`echo $line|cut -f1 -d:` &&
		# Extract audio basename to be used as the TTS prompt name
		prompt_basename=$(basename "$prompt_audio" .wav) &&
		prompt_speaker=$(basename "$2" .json) &&
		prompt_name="${prompt_basename}_${prompt_speaker}" &&
		# Extract Speaker Model ID from JSON file
    speakerID=`grep "speaker_id" $speaker_json|cut -f4 -d'"'` &&
		echo "Checking status from prompt " $prompt_name " ............." &&
		curl -X GET -u $useCred "$url/v1/customizations/$customID/prompts/$prompt_name"

	done < "$1"
