#!/bin/bash

. ./run samples/specs/stack.test_spec samples/code/stack.test.cpp
. ./run samples/specs/foo.test_spec samples/code/foo.test.cpp

pushd samples/projects
bash run_all.sh
popd
