#!/bin/bash

#######################################################
# GitHub Collaborator List Script
# Author: Emmanuel Mbagwu
#
# This script lists users with read access to a GitHub repository
# by making requests to the GitHub API.
#
# Required Environment Variables:
# - USERNAME: Your GitHub username
# - TOKEN: Your GitHub personal access token
#
# Usage: ./list_github_users.sh <repository_owner> <repository_name>
#
# Arguments:
# - <repository_owner>: The owner of the GitHub repository.
# - <repository_name>: The name of the GitHub repository.
#
# Example Usage:
# ./list_github_users.sh Brightfort MAIN-CHURCH-APP
#
#######################################################

# GitHub API URL
API_URL="https://api.github.com"

# Function to check if a variable is set
function check_variable {
    local var_name="$1"
    if [ -z "${!var_name}" ]; then
        echo "Error: Please export your github $var_name before executing the script."
        exit 1
    fi
}

# Check if USERNAME and TOKEN are set
check_variable "USERNAME"
check_variable "TOKEN"

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"
    # No need to check USERNAME and TOKEN here as they are checked above
    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
    local owner="$1"
    local repo="$2"
    local endpoint="repos/${owner}/${repo}/collaborators"
    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"
    # Display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for $owner/$repo."
    else
        echo "Users with read access to $owner/$repo:"
        echo "$collaborators"
    fi
}

# Check for the correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <repository_owner> <repository_name>"
    exit 1
fi

# Extract repository owner and name from command-line arguments
REPO_OWNER="$1"
REPO_NAME="$2"

# Main script
echo "Listing users with read access to $REPO_OWNER/$REPO_NAME..."
list_users_with_read_access "$REPO_OWNER" "$REPO_NAME"
