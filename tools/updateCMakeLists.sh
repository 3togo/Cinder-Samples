cp ../tools/CMakeLists.txt .
replace1="s/.*APP_NAME.*/\tAPP_NAME\t\"${PWD##*/}\"/"
replace2="s|.*SOURCES.*$.*|\tSOURCES\t\t"'${APP_PATH}'"/src/${PWD##*/}App.cpp|"
cmd="sed -i -e ${replace1};${replace2} CMakeLists.txt"
echo $cmd
$cmd
