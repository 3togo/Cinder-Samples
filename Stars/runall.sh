dirs=$(find . -type d -maxdepth)
for mdir in $dirs; do
	echo $mdir
done

