#! /bin/bash
cp ../tools/CMakeLists.txt .
replace1="s/.*APP_NAME.*/\tAPP_NAME\t\"${PWD##*/}\"/"
replace2="s|.*SOURCES.*$.*|\tSOURCES\t\t"'${APP_PATH}'"/src/${PWD##*/}App.cpp|"
files=$(find src -name "*.cpp")
for mfile in $files; do
	replace3+="s|.*SOURCES.*|&\n\tSOURCES\t\t"'${APP_PATH}'"/$mfile|;"
done
files=$(find ../TextRendering/include/text -name "*.cpp")
for mfile in $files; do
	replace4+="s|.*SOURCES.*|&\n\tSOURCES\t\t"'${APP_PATH}'"/$mfile|;"
done

cmd="sed -i -e ${replace1};${replace2};${replace3}${replace4} CMakeLists.txt"
echo $cmd
$cmd
#echo "files=$files"
