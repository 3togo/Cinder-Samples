#! /bin/bash
cp ../tools/CMakeLists.txt .
PROJECT=${PWD##*/}

replace1="s/.*APP_NAME.*/\tAPP_NAME\t\"$PROJECT\"/;"
replace1+="s/.*project(.*/project($PROJECT)/;"
#replace2="s|.*SOURCES.*$.*|\tSOURCES\t\t"'${APP_PATH}'"/src/${PWD##*/}App.cpp|;"
files=$(find src -name "*.cpp")" "$(find include -name "*.cpp")

for mfile in $files; do
	replace2+="s|.*SOURCES.*|&\n\tSOURCES\t\t"'${APP_PATH}'"/$mfile|;"
done

if $(grep -q Font src/*) ; then
	echo "include TextRendering"
	files=$(find ../TextRendering/include/text -name "*.cpp")
	for mfile in $files; do
		replace2+="s|.*SOURCES.*|&\n\tSOURCES\t\t"'${APP_PATH}'"/$mfile|;"
	done
fi
if $(grep -q Pistons src/*) ; then
	echo "include Pistons"
	files=$(find ../All/common -name "*.cpp")
	for mfile in $files; do
		replace2+="s|.*SOURCES.*|&\n\tSOURCES\t\t"'${APP_PATH}'"/$mfile|;"
	done
fi

cmd="sed -i -e ${replace1}${replace2} CMakeLists.txt"
echo $cmd
$cmd
#echo "files=$files"
