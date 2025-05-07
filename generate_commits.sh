#!/bin/bash


# Optional: Git user setup
git config user.name "RanyaAnjali"
git config user.email "rxnyaanjali25@gmail.com"

# Initial file
touch achievements.txt
echo "Achievements Log" > achievements.txt
git add achievements.txt
git commit -m "Initialize achievements tracking"

# Define commit messages
messages=(
  "Add Notification model"
  "Create messaging schema"
  "Implement notification sender logic"
  "Build message sending endpoint"
  "Display notifications in user dashboard"
  "Fix bug in message delivery"
  "Enable real-time notifications"
  "Add message read status"
  "Refactor notification controller"
  "Integrate messaging with user profiles"
  "Improve notification UI"
  "Add validation for message content"
  "Test notification delivery and read"
  "Fix timestamp bug in messages"
  "Style messaging inbox"
  "Add notification preferences"
  "Implement message reply feature"
  "Update docs for notification system"
  "Secure messaging endpoint"
  "Paginate user messages"
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
