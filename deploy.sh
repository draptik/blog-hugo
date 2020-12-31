#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
#hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
echo "Switching to public folder..."
cd public

echo "Current folder is $PWD"

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
    msg="$*"
fi

echo "Commiting changes..."
echo "Current folder is $PWD"
git commit -m "$msg"

# Push source and build repos.
echo "Pushing..."
echo "Current folder is $PWD"
git push origin master

