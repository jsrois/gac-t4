#!/bin/bash

echo "Installing google mock.. "
if [ ! -d "gmock-1.7.0" ]; then
 # get google mock
 bash ./build_gmock.sh
fi

echo "Running sample C++ projects..." 
# stack example
qmake stack.pro
make --quiet
./stack_test

# foo example
make clean
qmake foo.pro
make --quiet
./foo_test
