PS3="Select type of commit: "
COLUMNS=12

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

    echo "Do you want to push to your remote branch ? [y, n]"
    read push

    git add .
    git commit -m "$final"

    if [ "$push" = "y" ] || [ "$push" = "Y" ]
    then
        git push origin "$current_branch"
    else
        echo "====Commits are only in local. Push to remote to sync===="
    fi

    exit
done