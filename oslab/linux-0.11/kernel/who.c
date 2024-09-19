/*
write by lxn, 2024.09.18
*/
#include <linux/kernel.h>
#include <../include/unistd.h>

int sys_iam(const char* name){
    printk("i am sys_iam \n");
    return (0);
}

int sys_whoami(char* name, unsigned int size){
    printk("i am sys_whoami \n");
    return (0);
}

