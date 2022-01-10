#!/bin/zsh

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")

IGNORE_FILES=(
    Emacs.gitignore
    Vim.gitignore
    macOS.gitignore
    Linux.gitignore
)

echo "${IGNORE_FILES}"
FILE_PATHS=()
for file in $IGNORE_FILES
do
    FILE_PATHS+="${SCRIPTPATH}/gitignore/Global/${file}"
done
cat ${FILE_PATHS} > ${SCRIPTPATH}/.config/git/global_ignore
