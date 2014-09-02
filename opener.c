#include "opener.h"
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>


int open_file(const char* fname)
{
    int fd;
    fd = open(fname, O_CREAT);
    close(fd);
}
