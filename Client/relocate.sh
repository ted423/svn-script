#/bin/bash
REPO_BASE="/repo/"

cd "$REPO_BASE"
pwd
for f in *; do
    url1=$(svn info --show-item repos-root-url "$f")
    url2=$(echo "$url1"|sed 's/192.168.X.X/192.168.X.X/')
    echo "$url2"
    svn relocate "$url1" "$url2" "$f" --username XX --password XX
done 