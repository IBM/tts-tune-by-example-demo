#!/bin/bash
. cfg.sh
#
# Replace spaces an dashes in the audio filenames with underscore "_"
for d in *.wav; do mv "$d" "${d// /_}"; done
for d in *.wav; do mv "$d" "${d//-/_}"; done
#
# Cataloging all the WAV files from the current folder into "audiofiles.txt"
ls -1 *.wav > audiofiles.txt
#
# Creating a speaker model for each WAV audio file in "audiofiles.txt"
# The Speaker model id will be stored in the JSON file with the same name as the audio file
#
while IFS= read -r file
	do
		bname=$(basename "$file" .wav) &&
		echo "Creating speaker id for" $file " ............." &&
    curl -X POST -u $useCred --header "Content-Type: audio/wav" --data-binary "@$file" "$url/v1/speakers/$bname" > $bname.json

	done < "audiofiles.txt"
