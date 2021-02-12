#!/bin/bash
. cfg.sh
#
for d in *.json; do mv "$d" "${d// /_}"; done
#
# Cataloging all the WAV files in "audiofiles" folder
#ls -1 *.wav > wavfiles.txt
ls -1 *.json > jsonfiles.txt
#
# Converting each WAV file listed in the text file "wavfiles.txt"
#

while IFS= read -r file
	do
		spk_bname=$(basename "$file" .json) &&
		prompt_file=$spk_bname.txt &&
		prompt_text=`cat $prompt_file` &&
    speakerID=`grep "speaker_id" $file|cut -f4 -d'"'` &&
		echo "Generating audio file " $spk_bname-tbe.wav " from speaker id " $spk_bname " ............." &&
		curl -X POST -u $useCred --header "Content-Type: application/json" --header "Accept: audio/wav" --data "{\"text\":\"<ibm:prompt id='$spk_bname'/>\"}" --output ./$spk_bname-tbe.wav "$url/v1/synthesize?customization_id=$customID&voice=$voice"

	done < "jsonfiles.txt"
