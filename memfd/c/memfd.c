#include <sys/syscall.h>
#include <linux/memfd.h>

#include "memfd.h"

//int memfd_new(char name, elfbuffer u8, elfbuffer_len int) {
int memfd_new(char name) {
    int fd;
    fd = memfd_create("Server memfd", MFD_CLOEXEC);
    //if (fd == -1)

    // write(fd, elfbuffer, elfbuffer_len);
    // asprintf(p, "/proc/self/fd/%i", fd);
    // execl(p, "kittens", "arg1", "arg2", NULL);
    return fd;
}

