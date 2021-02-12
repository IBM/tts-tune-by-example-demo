#!/bin/bash
. cfg.sh
#
# Need a text file as argument
var=${1:?You have to provide a text file with utterances as an argument}
# Creates a timestamp for the directory name
timestamp=$(date +%m%d%y-%H%M%S)
# Creates a folder with a name composed of the timestamp and the text file argument
mkdir $timestamp$1
cp $1 ./$timestamp$1
COUNTER=1
# Creates a text file output to match the string with the audio file generated
echo "List of SSML tags with their voice audio output using " $voice > ./$timestamp$1/AudioList.txt
echo "" >> ./$timestamp$1/AudioList.txt
# Reading each line of the text file
while IFS='' read -r line || [[ -n "$line" ]]; do
    # Replacing punctuations with underscore for filename
    output1=$(echo $line | tr " " "_") &&
    output2=$(echo $output1 | tr "." "_") &&
    output3=$(echo $output2 | tr "?" "_") &&
    output4=$(echo $output3 | tr "!" "_") &&
    output_std_wav=$(echo $output4 | tr "," "_") &&
    echo "Processing tag " $line " into " $output_std_wav.wav " using voice " $voice &&
    echo "SSML Tag: " $line " -- TTS Standard Audio File " $output_std_wav.wav >> ./$timestamp$1/AudioList.txt &&
    curl -X POST -u $useCred --header "Content-Type: application/json" --header "Accept: audio/wav" --data "{\"text\":\"$line\"}" --output ./$timestamp$1/$output_std_wav-std.wav "$url/v1/synthesize?voice=$voice" &&
    let COUNTER=COUNTER+1
	done < "$1"
