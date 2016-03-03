#! /bin/bash
pushd .
echo "Installing gmock..."
wget https://googlemock.googlecode.com/files/gmock-1.7.0.zip
unzip gmock-1.7.0.zip
GMOCK_PATH=$PWD/gmock-1.7.0
GTEST_PATH=$GMOCK_PATH/gtest
mkdir $GMOCK_PATH/lib $GTEST_PATH/lib
pushd $GMOCK_PATH/lib
cmake -DBUILD_SHARED_LIBS=ON ..
make
cd $GTEST_PATH/lib
cmake -DBUILD_SHARED_LIBS=ON ..
make
popd
