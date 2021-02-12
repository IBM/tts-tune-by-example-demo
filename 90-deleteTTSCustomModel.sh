#!/bin/bash
. cfg.sh
#
curl -X DELETE -u $useCred "$url/v1/customizations/$customID"
