#!/bin/bash


# Optional: Git user setup
git config user.name "OmashV"
git config user.email "vidurangaomash@gmail.com"

# Initial file
touch achievements.txt
echo "Achievements Log" > achievements.txt
git add achievements.txt
git commit -m "Initialize achievements tracking"

# Define commit messages
messages=(
  "Add LearningPlan model"
  "Implement learning plan creation endpoint"
  "Fix bug in learning plan update logic"
  "Add validation for learning plan fields"
  "Create UI for learning plan list view"
  "Implement delete functionality for learning plans"
  "Refactor learning plan controller"
  "Add learning plan detail view"
  "Test learning plan create and update"
  "Improve error handling in learning plan service"
  "Link learning plans to user profiles"
  "Add timestamps to learning plans"
  "Style learning plan list"
  "Fix date sorting in learning plans"
  "Update API docs for learning plans"
  "Add search feature for learning plans"
  "Enable pagination for learning plan list"
  "Fix typo in learning plan form"
  "Improve performance of learning plan queries"
  "Allow learning plan editing by owner only"
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
