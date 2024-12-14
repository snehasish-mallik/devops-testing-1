#!/bin/bash

API_URL="https://api.github.com"

USERNAME=$username
TOKEN=$token

REPOW="snehasish-mallik"
REPON="HCLInsurance"

function get-all-branch{
local endpoint="repos/${REPOW}/${REPON}/branches"
local url="${API_URL}/${endpoint}"
branches=$(curl -s -u "${USERNAME}:${TOKEN}" "$url")
if [[ -z "$branches" ]]; then
echo "zero branch"
else
echo "$branches"
fi
}

get-all-branch
