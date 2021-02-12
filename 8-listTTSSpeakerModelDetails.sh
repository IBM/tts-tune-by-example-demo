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
		bname=$(basename "$file" .json) &&
    speakerID=`grep "speaker_id" $file|cut -f4 -d'"'` &&
		echo "Getting details from speaker id " $file " ............." &&
		curl -X GET -u $useCred "$url/v1/speakers/$speakerID" > $bname-details.txt

	done < "jsonfiles.txt"
