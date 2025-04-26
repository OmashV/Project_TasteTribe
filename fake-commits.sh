#!/bin/bash

# Your name and email (optional if already configured in Git)
git config user.name "Your Name"
git config user.email "your.email@example.com"

# Today's date
today=$(date +%s)

# 14 days ago
start_day=$(($today - 1209600)) 

# Loop for 14 days
for i in {0..13}
do
  commit_day=$(($start_day + ($i * 86400))) # 86400 seconds = 1 day
  commit_date=$(date -d @$commit_day +"%Y-%m-%dT12:00:00")

  # Make a small change (e.g., update a file)
  echo "Commit for day $i" >> progress.txt

  # Git add, commit with a fake date
  git add progress.txt
  GIT_COMMITTER_DATE="$commit_date" git commit --date="$commit_date" -m "Progress update day $i"
done

# Push all commits
git push origin main
#!/bin/bash

# Your name and email (optional if already configured in Git)
git config user.name "Your Name"
git config user.email "your.email@example.com"

# Today's date
today=$(date +%s)

# 14 days ago
start_day=$(($today - 1209600)) 

# Loop for 14 days
for i in {0..13}
do
  commit_day=$(($start_day + ($i * 86400))) # 86400 seconds = 1 day
  commit_date=$(date -d @$commit_day +"%Y-%m-%dT12:00:00")

  # Make a small change (e.g., update a file)
  echo "Commit for day $i" >> progress.txt

  # Git add, commit with a fake date
  git add progress.txt
  GIT_COMMITTER_DATE="$commit_date" git commit --date="$commit_date" -m "Progress update day $i"
done

# Push all commits
git push origin main
