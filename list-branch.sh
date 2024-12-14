#!/bin/bash

###############
# Author: Snehasish Mallik
# Date: 12-14-2024
# Purpose: List all the branches in a repo from CLI
###############

API_URL="https://api.github.com"

# You can export and use them here
USERNAME=$username
TOKEN=$token

# Pass these values while running the command
REPOW=$1
REPON=$2

# Function which first creates the URL and gets the data from GitHub API using your credentials
function get_all_branch {
    local endpoint="repos/${REPOW}/${REPON}/branches"
    local url="${API_URL}/${endpoint}"
    branches=$(curl -s -u "${USERNAME}:${TOKEN}" "$url")
    
    if [[ -z "$branches" ]]; then
        echo "Zero branches found."
    else
        echo "Branches in repository ${REPON}:"
        echo "$branches" | jq -r '.[].name'
    fi
}

# Calling and printing all the branches in a specific repo
echo "Fetching all branches in $REPON..."
get_all_branch

