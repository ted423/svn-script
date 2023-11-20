#/bin/bash
REPO_BASE=/repository/
TARGET=/mnt/Backup/
today=`date +%Y-%m-%d`
lastweek=`date --date='-3 day' +%Y-%m-%d`
firstday=`date +%d`


if [ ! -d $TARGET/$today ]
then
mkdir "$TARGET/$today"
fi

cd "$REPO_BASE"
for f in *; do
	FILE="$TARGET/$today/$f.dump"
	echo "Dump: $f => $FILE"
    test -d "$f"  &&  svnadmin dump "$f" > "$FILE"
done