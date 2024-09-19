/*
write by lxn, 2024.09.18
*/

#define __LIBRARY__
#include <unistd.h>

_syscall2(int,whoami,char*,name,unsigned int,size);