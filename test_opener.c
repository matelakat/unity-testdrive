#include "unity_fixture.h"
#include "opener.h"

TEST_GROUP(Opener);


TEST_SETUP(Opener)
{
    reset_open_calls_counter();
}


TEST_TEAR_DOWN(Opener)
{
}


TEST(Opener, open_overriden)
{
    open_file("filename");
    TEST_ASSERT_EQUAL(1, get_open_calls_counter());
}


TEST(Opener, close_overriden)
{
    open_file("filename");
    TEST_ASSERT_EQUAL(2, get_close_calls_counter());
}


TEST_GROUP_RUNNER(Opener)
{
    RUN_TEST_CASE(Opener, open_overriden);
    RUN_TEST_CASE(Opener, close_overriden);
}
