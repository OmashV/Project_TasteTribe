#!/bin/bash


# Optional: Git user setup
git config user.name "Binuri321"
git config user.email "binuriminoshi0@gmail.com"

# Initial file
touch achievements.txt
echo "Achievements Log" > achievements.txt
git add achievements.txt
git commit -m "Initialize achievements tracking"

# Define commit messages
messages=(
  "Add Post model"
  "Implement post creation endpoint"
  "Fix bug in post update logic"
  "Add validation for post content"
  "Create UI for post list view"
  "Implement delete functionality for posts"
  "Refactor post controller"
  "Add post detail view"
  "Test post create and update"
  "Improve error handling in post service"
  "Link posts to user profiles"
  "Add timestamps to posts"
  "Style post list"
  "Fix date sorting in posts"
  "Update API docs for posts"
  "Add search feature for posts"
  "Enable pagination for post list"
  "Fix typo in post form"
  "Improve performance of post queries"
  "Allow post editing by author only"
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
