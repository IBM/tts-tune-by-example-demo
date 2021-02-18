#!/bin/bash
. cfg.sh
#
var=${1:?You have to provide an EDB text filename with no spaces as an argument}
#
while IFS= read -r line
	do
		# Extract audio filename from EDB file
		prompt_audio=`echo $line|cut -f1 -d:` &&
		# Extract audio basename to be used as the TTS prompt name
		prompt_basename=$(basename "$prompt_audio" .wav) &&
		prompt_name="${prompt_basename}_noSpeaker" &&
		# Extract Speaker Model ID from JSON file
		echo "Checking status from prompt " $prompt_name " ............." &&
		curl -X GET -u $useCred "$url/v1/customizations/$customID/prompts/$prompt_name"

	done < "$1"
