#!/bin/bash


# Optional: Git user setup
git config user.name "malindusahan"
git config user.email "balasooriyamalindu@gmail.com"

# Initial file
touch achievements.txt
echo "Achievements Log" > achievements.txt
git add achievements.txt
git commit -m "Initialize achievements tracking"

# Define commit messages
messages=(
  "Add Achievement model"
  "Implement achievement creation endpoint"
  "Fix bug in achievement update logic"
  "Add validation for achievement title"
  "Create UI for achievement list view"
  "Implement delete functionality for achievements"
  "Refactor achievement controller"
  "Add achievement detail view"
  "Test achievement create and update"
  "Improve error handling in achievement service"
  "Link achievements to user profiles"
  "Add timestamps to achievements"
  "Style achievements list"
  "Fix date sorting in achievements"
  "Update API docs for achievements"
  "Add search feature for achievements"
  "Enable pagination for achievements list"
  "Fix typo in achievement form"
  "Improve performance of achievements query"
  "Allow achievement editing by owner only"
)

# Loop through last 21 days
for day_offset in {20..0}; do
  # Randomly decide whether to make 1 or 2 commits
  num_commits=$((1 + RANDOM % 2))

  for ((i=0; i<num_commits; i++)); do
    # Random commit time during the day
    hour=$((RANDOM % 10 + 9))    # between 9 AM and 6 PM
    minute=$((RANDOM % 60))
    second=$((RANDOM % 60))

    commit_date=$(date -d "$day_offset days ago $hour:$minute:$second" "+%Y-%m-%dT%H:%M:%S")

    # Pick a random message
    msg_index=$((RANDOM % ${#messages[@]}))
    commit_msg=${messages[$msg_index]}

    # Make a fake change
    echo "$commit_msg - $(date)" >> achievements.txt
    git add achievements.txt

    # Make the commit with custom date
    GIT_COMMITTER_DATE="$commit_date" git commit --date="$commit_date" -m "$commit_msg"
  done
done

# Optional: Push to GitHub
# git remote add origin https://github.com/your-username/your-repo.git
# git branch -M main
# git push -u origin main
