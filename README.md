# Scripts to list github users in bash and python
#
## Bash Script README
#
#### Script Name: list_github_users.sh

- Author: John Doe

- Overview
This Bash script allows you to list users with read access to a GitHub repository using the GitHub API. It requires the environment variables USERNAME (GitHub username) and TOKEN (GitHub personal access token) to be set before execution.

Required Environment Variables
- USERNAME: Your GitHub username.
- TOKEN: Your GitHub personal access token.

#### Usage
```bash
./list_github_users.sh <repository_owner> <repository_name>
```

- <repository_owner>: The owner of the GitHub repository.
- <repository_name>: The name of the GitHub repository.

#### Example Usage
To list users with read access to a repository owned by "Brightfort" and named "MAIN-CHURCH-APP," execute the script as follows:

```bash
./list_github_users.sh Brightfort MAIN-CHURCH-APP
```

#### Sample Response (Successful Execution)
Listing users with read access to Brightfort/MAIN-CHURCH-APP...
Users with read access to Brightfort/MAIN-CHURCH-APP:
- User1
- User2
- User3


#### Sample Response (Missing Required Arguments)
#
#### Usage
```bash
./list_github_users.sh <repository_owner> <repository_name>
```
#
## Python Script README
#
### Script Name: list_github_users.py

- Author: Jane Smith

#### Overview
This Python script serves the same purpose as the Bash script, allowing you to list users with read access to a GitHub repository using the GitHub API. It also requires the environment variables USERNAME (GitHub username) and TOKEN (GitHub personal access token) to be set before execution.

##### Required Environment Variables
- USERNAME: Your GitHub username.
- TOKEN: Your GitHub personal access token.

#### Usage
```bash
./list_github_users.py <repository_owner> <repository_name>
```
- <repository_owner>: The owner of the GitHub repository.
- <repository_name>: The name of the GitHub repository.

#### Example Usage
To list users with read access to a repository owned by "Brightfort" and named "MAIN-CHURCH-APP," execute the script as follows:

```bash
./list_github_users.py Brightfort MAIN-CHURCH-APP
```
#### Sample Response (Successful Execution)
Listing users with read access to Brightfort/MAIN-CHURCH-APP...
Users with read access to Brightfort/MAIN-CHURCH-APP:
- User1
- User2
- User3

#### Sample Response (Missing Required Arguments)
#
#### Usage
```bash
./list_github_users.py <repository_owner> <repository_name>
```

## Running the Script (Both bash or python script)
If you encounter permission issues and the script is not executable, you can make it executable using the following command:
```bash
chmod +x <file_name>
```