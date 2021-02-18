#!/bin/bash
. cfg.sh
#
var=${1:?You have to provide an EDB text filename with no spaces as an argument}
# Creates a timestamp for the directory name
timestamp=$(date +%m%d%y-%H%M%S)
# Creates a folder with a name composed of the timestamp and the text file argument
mkdir $timestamp$1-tbe-noSpeaker
#
#
while IFS= read -r line
	do
		# Extract audio filename from EDB file
		prompt_audio=`echo $line|cut -f1 -d:` &&
		# Extract audio basename to be used as the TTS prompt name
		prompt_basename=$(basename "$prompt_audio" .wav) &&
		prompt_name="${prompt_basename}_noSpeaker" &&
		# Extract Speaker Model ID from JSON file
		echo "Generating audio file " $prompt_audio-tbe-noSpeaker.wav " using prompt " $prompt_name "............" &&
	  curl -X POST -u $useCred --header "Content-Type: application/json" --header "Accept: audio/wav" --data "{\"text\":\"<ibm:prompt id='$prompt_name'/>\"}" --output ./$timestamp$1-tbe-noSpeaker/$prompt_audio-tbe-noSpeaker.wav "$url/v1/synthesize?customization_id=$customID&voice=$voice"

	done < "$1"
