/*
write by lxn, 2024.09.18
*/
#include <linux/kernel.h>
#include <unistd.h>

int sys_iam(const char* name){
    printk("User name is %s\n", name);
    return (0);
}

int sys_whoami(char* name, unsigned int size){
    printk("User name is %s\n", name);
    return (0);
}

