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
		# Extract text utterance from EDB file
		prompt_text=`echo $line|cut -f2 -d:` &&
		# Extract Speaker Model ID from JSON file
		echo "Creating prompt " $prompt_name " from " $prompt_audio " audio file with text utterance " $prompt_text "............" &&
		curl -X POST -u $useCred --header "Content-Type:multipart/form-data" --form metadata="{\"prompt_text\": \"$prompt_text\"}" --form file=@$prompt_audio "$url/v1/customizations/$customID/prompts/$prompt_name"

	done < "$1"
