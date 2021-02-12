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
    speakerID=`grep "speaker_id" $file|cut -f4 -d'"'` &&
		echo "Deleting speaker id for" $file " ............." &&
    curl -X DELETE -u $useCred "$url/v1/speakers/$speakerID" &&
    rm $file

	done < "jsonfiles.txt"
