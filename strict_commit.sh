PS3="Select type of commit: "

commit_types=(
"feat 🚀:" 
"bugfix 🫡:" 
"refactor 🥸:"
"conflict_fix 🤯:"
"docs 😶‍🌫️:"
"style 💇🏽‍♂️:"
"test 🧪:"
"chore 🛒:"
"merge ⧉:"
)

current_branch=$(git symbolic-ref --short -q HEAD)

select character in "${commit_types[@]}"
do
    echo "Enter your commit message for $character"
    read commit
    final="$character $commit"

    git add .
    git commit -m "$final"
    git push origin "$current_branch"

    exit
done