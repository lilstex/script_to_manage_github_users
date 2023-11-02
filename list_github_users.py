#!/usr/bin/python3

import os
import sys
import requests

# GitHub API URL
API_URL = "https://api.github.com"

# Function to check if an environment variable is set
def check_variable(var_name):
    if var_name not in os.environ:
        print(f"Error: Please set the {var_name} environment variable before executing the script.")
        sys.exit(1)

# Function to make a GET request to the GitHub API
def github_api_get(endpoint):
    check_variable("USERNAME")
    check_variable("TOKEN")
    url = f"{API_URL}/{endpoint}"
    response = requests.get(url, auth=(os.environ["USERNAME"], os.environ["TOKEN"]))
    return response.json()

# Function to list users with read access to the repository
def list_users_with_read_access(owner, repo):
    endpoint = f"repos/{owner}/{repo}/collaborators"
    response_data = github_api_get(endpoint)

    if not response_data:
        print(f"No response received from GitHub API for {owner}/{repo}.")
        sys.exit(1)

    if "message" in response_data:
        print(f"GitHub API error: {response_data['message']}")
        sys.exit(1)

    collaborators = [collaborator["login"] for collaborator in response_data if collaborator.get("permissions", {}).get("pull") == True]

    if not collaborators:
        print(f"No users with read access found for {owner}/{repo}.")
    else:
        print(f"Users with read access to {owner}/{repo}:")
        print("\n".join(collaborators))

# Check for the correct number of arguments
if len(sys.argv) != 3:
    print("Usage: ./list_github_users.py <repository_owner> <repository_name>")
    sys.exit(1)

# Extract repository owner and name from command-line arguments
REPO_OWNER = sys.argv[1]
REPO_NAME = sys.argv[2]

# Main script
print(f"Listing users with read access to {REPO_OWNER}/{REPO_NAME}...")
list_users_with_read_access(REPO_OWNER, REPO_NAME)
