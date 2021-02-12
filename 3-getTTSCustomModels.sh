#!/bin/bash
. cfg.sh
#
curl -X GET -u $useCred "$url/v1/customizations/$customID"
