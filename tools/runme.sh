../tools/updateCMakeLists.sh
build_type=Release
#cinder_paths=$(find ~/git -type d -regex  "Cinder$")
cinder_paths=$(find ~/git -maxdepth 2 -type d -name  Cinder)

echo "num=${#cinder_paths[@]}"

if ! [ ${#cinder_paths[@]} -eq 1 ]; then
    echo "Install Cinder in ~/git first"
    echo "https://libcinder.org/docs/guides/linux-notes/ubuntu.html"
fi
cinder_path=${cinder_paths[0]}
if [[ ! -d $cinder_path/buid ]]; then
    if [[ ! -d $cinder_path/buid_release ]]; then
        cmd="ln -sf $cinder_path/build_Release $cinder_path/build"
    elif [[ ! -d $cinder_path/buid_debug ]]; then
        cmd="ln -sf $cinder_path/build_Debug $cinder_path/build"
    else
        echo "cannot find cinder path"
        exit
    fi
fi
echo $cmd
$cmd
oldpwd=$PWD
echo "cinder_path=$cinder_path"

[[ ! -d build ]] &&  mkdir build
cd build
if [ ! -f CMakeCache.txt  ] || [  -z $1 ] ; then 
	cmake -DCMAKE_BUILD_TYPE=$build_type -DCINDER_PATH=$cinder_path ..
    echo "run cmake and clean"
    make clean
fi
make -j $(nproc)
#cmd="$build_type/release/DisplayShift/DisplayShift"
cd $oldpwd
#find . -type f -name ${PWD##*/} -exec bash -c 'time $1 &' - {} \;
find . -type f -name ${PWD##*/}|grep $build_type |xargs -I {} bash -c 'time $1 &' - {} \; 

