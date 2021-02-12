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
		echo "Creating prompt " $prompt_text " from speaker id " $file " ............." &&
		curl -X POST -u $useCred --header "Content-Type:multipart/form-data" --form metadata="{\"prompt_text\": \"$prompt_text\", \"speaker_id\": \"$speakerID\"}" --form file=@$spk_bname.wav "$url/v1/customizations/$customID/prompts/$spk_bname"

	done < "jsonfiles.txt"
