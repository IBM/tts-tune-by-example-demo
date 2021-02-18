#!/bin/bash
. cfg.sh
var=${1:?You have to provide a WAV audio filename with no spaces as an argument}
#
# The Speaker model id will be stored in the JSON file with the same name as the audio file
bname=$(basename "$1" .wav) &&
echo "Creating speaker id for" $1 " ............." &&
curl -X POST -u $useCred --header "Content-Type: audio/wav" --data-binary "@$1" "$url/v1/speakers/$bname" > $bname.json
