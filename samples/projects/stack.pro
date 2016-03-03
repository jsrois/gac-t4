CONFIG -= qt
TARGET  = stack_test

GMOCK_PATH = gmock-1.7.0
GTEST_PATH = $${GMOCK_PATH}/gtest
#googletest & googlemock
INCLUDEPATH += $${GMOCK_PATH}/include $${GTEST_PATH}/include
LIBS += -L$${GTEST_PATH}/lib -L$${GMOCK_PATH}/lib -lgmock -lgtest -lpthread
QMAKE_RPATHDIR += $${GTEST_PATH}/lib $${GMOCK_PATH}/lib

HEADERS = ../code/stack.h
SOURCES = ../code/stack.test.cpp

CONFIG += c++11
