LIB_DIR=/usr/lib/x86_64-linux-gnu
LIB_IRRKLANG=libIrrKlang.so
if [ ! -f $LIB_DIR/$LIB_IRRKLANG ];then
    sudo cp irrKlang-64bit-1.6.0/bin/linux-gcc-64/* $LIB_DIR
    echo "$LIB_IRRKLANG installed."
else
    echo "$LIB_IRRKLANG has already installed"
fi
