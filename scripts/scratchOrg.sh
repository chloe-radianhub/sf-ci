#!/bin/bash

## STOP SCRIPT EXECUTION ON ERROR
set -euo pipefail

##  ECHO COLORS
ORANGE='\033[38;5;214m'
BRed='\033[1;31m' 
RED='\033[0;31m'
BLUE='\033[1;34m'
DEFAULT='\033[m' # No Color

## STORE LAST FUNCTION NAME
LAST_ARG=''

## CALL THIS ON ERROR
notify() {
    echo -e "${BRed}${LAST_ARG} Error ${RED}$(caller): ${BASH_COMMAND}"
    echo -e "$DEFAULT"
}
trap notify ERR

function echo_block() {
    echo -e "${BLUE}**************************************************";
    echo -e "${ORANGE} $1 $2 ${BLUE} $(date)" 
    echo -e "**************************************************${DEFAULT}";
}

function echo_wrapper() {
    if [[ ! -z $LAST_ARG ]]; then
        echo_block "${LAST_ARG}" "Complete"
        echo ""
    fi

    echo_block "$1" "Starting"
    LAST_ARG=$1
}

## CREATE SCRATCH ORG
project="lp-eta"
branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
scratchOrgName="$project-$branch"

echo_wrapper "Create Scratch Org" 
# sf org create scratch -f ./config/project-scratch-def.json -a "$scratchOrgName" -y 14 -w 60 -d
sf org create scratch -f ./config/project-scratch-def.json -a my-scratch -y 14 -w 60 -d --target-dev-hub ghActionPlayground --name "$scratchOrgName"