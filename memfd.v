module memfd

#flag -I @VMODROOT/c
#flag @VMODROOT/c/memfd.o

#include "memfd.h"

fn C.memfd_new(string) int

pub fn vmemfd_new(a string) int {
	return C.memfd_new(a)
}
