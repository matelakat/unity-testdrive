static int open_calls_counter;
static int close_calls_counter;


int get_open_calls_counter(void)
{
    return open_calls_counter;
}


int get_close_calls_counter(void)
{
    return close_calls_counter;
}


void reset_open_calls_counter(void)
{
    open_calls_counter = 0;
    close_calls_counter = 0;
}


int open(const char *pathname, int flags)
{
    open_calls_counter += 1;
    return 7;
}


int close(int fd)
{
    close_calls_counter += 1;
}
