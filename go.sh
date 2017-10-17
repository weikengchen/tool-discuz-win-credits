#!/bin/bash

# your user id from the website
fromuid=47998
# the url of the website, not ended by /
website="http://www.ustcjz.cn"

loadtime=1000

randfunc=""

if command -v shuf > /dev/null; then
	randfunc="shuf"
else
	if command -v gshuf > /dev/null; then
		randfunc="gshuf"
	else
		echo "Please install shuf by apt install coreutils or brew install coreutils.">&2
		exit 1;
	fi	
fi

tmpfilename=$(mktemp)

for i in `seq 1 $loadtime`;
do
	a=$(shuf -i 0-255 -n 1)
	b=$(shuf -i 0-255 -n 1)
	c=$(shuf -i 0-255 -n 1)
	d=$(shuf -i 0-255 -n 1)
	
	curl -s -c $tmpfilename --header "X-Forwarded-For: $a.$b.$c.$d" "$website/forum.php?fromuid=$fromuid" > /dev/null
	curl -s -c $tmpfilename --header "X-Forwarded-For: $a.$b.$c.$d" "$website/forum.php" > /dev/null
	rm $tmpfilename
done

