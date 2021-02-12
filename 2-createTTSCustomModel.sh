#!/bin/bash
. cfg.sh
#
var=${1:?You have to provide a TTS model customization name with no spaces as an argument}
curl -X POST -u $useCred --header "Content-Type: application/json" --data "{\"name\":\"$1 Model\", \"language\":\"$lang\", \"description\":\"$1 custom voice model\"}" "$url/v1/customizations" > tts-custom-model.txt
