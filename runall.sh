dirs=$(find . -maxdepth 1 -type d)

for mdir in $dirs; do
	mdir=${mdir:2}
	#echo "($mdir)"
	if [[ ! "$mdir" =~ ^(All|\.git|tools|)$ ]]; then
		echo $mdir
		cd $mdir
		../tools/runme.sh &
		#echo "PWD=$PWD"
		cd ..
	fi
done

