#include "unity_fixture.h"

TEST_GROUP(Opener);


TEST_SETUP(Opener)
{
}


TEST_TEAR_DOWN(Opener)
{
}


TEST(Opener, open_overriden)
{
}


TEST_GROUP_RUNNER(Opener)
{
    RUN_TEST_CASE(Opener, open_overriden);
}
