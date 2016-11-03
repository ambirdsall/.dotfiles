# usage:
# ./import.sh <repo>
#   <repo>   => the name of a repo as hosted in my github acct
#
# This adds the project files from <repo> to the current project inside
# a subdirectory of the same name, along with their whole history and a single
# commit.

REPO_NAME=$1

git remote add ${REPO_NAME}_remote git@github.com:ambirdsall/${REPO_NAME}.git
git fetch ${REPO_NAME}_remote
git merge -s ours --no-commit ${REPO_NAME}_remote/master
git read-tree --prefix =${REPO_NAME}/ -u ${REPO_NAME}_remote/master
git commit -m "Imported ${REPO_NAME} as a subtree."
