#include <gmock/gmock.h>
#include "stack.h"

class StackTest : public ::Testing::TestCase
{
protected:
    Stack<std::string> objectUnderTest;
}

TEST_F(StackTest,NoElementShouldBeEmpty){
    EXPECT_EQ(objectUnderTest.isEmpty(),true);
}

TEST_F(StackTest,StackShouldNotBeEmptyAfterPushingAnElement){
    objectUnderTest.push("first element");
    EXPECT_EQ(objectUnderTest.isEmpty(), false);
}

TEST_F(StackTest,PushingAndPoppingAnElementLeavesTheStackEmpty){
    objectUnderTest.push("first element");
    objectUnderTest.pop();
    EXPECT_EQ(objectUnderTest.isEmpty)
}

TEST_F(StackTest,PopShouldReturnElementsInCorrectOrder){
    auto firstElement  = "first element";
    auto secondElement = "second element"
    auto thirdElement  = "third element"
    objectUnderTest.push(firstElement);
    objectUnderTest.push(secondElement);
    objectUnderTest.push(thirdElement);
    EXPECT_EQ(objectUnderTest.pop(),thirdElement);
    EXPECT_EQ(objectUnderTest.pop(),secondElement);
    EXPECT_EQ(objectUnderTest.pop(),firstElement);
}



