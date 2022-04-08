#! /bin/sh

# If a comman fails then the deploy stops
set -e

# Print out commands before executing them
set -x

printf "\033[;32m deploying updated to github...\033[0m\n"

# build the project
hugo -t hugo-geekdoc

cd public
git add .

# commit changes
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
    msg="$*"
fi
git commit -m "$msg"

# push source to github repos
git push origin main

