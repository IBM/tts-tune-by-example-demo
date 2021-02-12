#!/bin/bash
# DO NOT CHANGE
lang=en-US
#lang=es-ES
#lang=fr-FR
#lang=de-DE
#lang=it-IT

# DO NOT CHANGE
credF=tts-credentials.txt
useCred=`cat $credF`
cIDfile=tts-custom-model.txt
customID=`grep "customization_id" $cIDfile|cut -f4 -d'"'`

# Instance URL
url="url_of_TTS_Cloud_instance"

#
# VALUES THAT CAN BE UPDATED
# For "voice" value, uncomment ONLY one value at a time
# NEURAL VOICES
voice=en-US_EmilyV3Voice
#voice=en-US_AllisonV3Voice
#voice=en-US_HenryV3Voice
#voice=en-US_KevinV3Voice
#voice=en-US_LisaV3Voice
#voice=en-US_MichaelV3Voice
#voice=en-US_OliviaV3Voice
#voice=es-ES_EnriqueV3Voice
#voice=en-ES_LauraV3Voice
#voice=fr-FR_ReneeV3Voice
#voice=de-DE_BirgitV3Voice
#voice=de-DE_DieterV3Voice
#voice=de-DE_ErikaV3Voice
#voice=it-IT_FrancescaV3Voice
#voice=jp-JP_EmiV3Voice
#voice=de-DE_ErikaV3Voice
#voice=de-DE_ErikaV3Voice
#voice=de-DE_ErikaV3Voice
#voice=de-DE_ErikaV3Voice
#voice=de-DE_ErikaV3Voice
#voice=de-DE_ErikaV3Voice
#voice=fr-CA_LouiseV3Voice
