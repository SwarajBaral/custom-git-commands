PS3="Select type of commit: "
COLUMNS=12

commit_types=(
"feat π:" 
"bugfix π«‘:" 
"refactor π₯Έ:"
"conflict_fix π€―:"
"docs πΆβπ«οΈ:"
"style ππ½ββοΈ:"
"test π§ͺ:"
"chore π:"
"merge β§:"
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