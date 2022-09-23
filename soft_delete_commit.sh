bold=$(tput bold)
normal=$(tput sgr0)

clear
echo "${bold}Deleting commit from local only !${normal}"

current_branch=$(git symbolic-ref --short -q HEAD)
recent_commit=$(git log -n 1 $current_branch)

echo "\nAre you sure you want to remove this commit ? :- \n"
echo "================================================"
echo "\n${bold}$recent_commit${normal}\n"
echo "================================================"

echo "\nEnter 'y' to proceed and 'n' to exit :-"
read consent

if [ "$consent" = "y" ]
then
    git reset --soft HEAD~1
    echo "Deleted commit from local without removing your recent work"
else
    :
fi
