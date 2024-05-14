#!/bin/bash

# Change to the main branch
git checkout main

# Stage all changes
git add .

# Prompt for commit message
echo -n "Enter commit message: "
read commit_message

# Commit changes with the provided message
git commit -m "$commit_message"

# Push changes to the remote repository
git push origin main
