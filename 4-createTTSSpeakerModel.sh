#!/bin/bash
. cfg.sh
#
for d in *.wav; do mv "$d" "${d// /_}"; done
#
# Cataloging all the WAV files in "audiofiles" folder
#ls -1 *.wav > wavfiles.txt
ls -1 *.wav > audiofiles.txt
#
# Converting each WAV file listed in the text file "wavfiles.txt"
#
while IFS= read -r file
	do
		bname=$(basename "$file" .wav) &&
		echo "Creating speaker id for" $file " ............." &&
    curl -X POST -u $useCred --header "Content-Type: audio/wav" --data-binary "@$file" "$url/v1/speakers/$bname" > $bname.json

	done < "audiofiles.txt"
