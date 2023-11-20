#/bin/bash
REPO_BASE=/repository/
BACk=/mnt/Backup/
today=`date +%Y-%m-%d`
lastweek=`date --date='-3 day' +%Y-%m-%d`
firstday=`date +%d`


if [ ! -d $BACk/$today ]
then
mkdir "$BACk/$today"
fi

cd "$REPO_BASE"
for f in *; do
	TARGET="$BACk/$today/$f"
	echo "copy: $f => $FILE"
    test -d "$f"  &&  svnadmin hotcopy "$f"   "$TARGET"
done