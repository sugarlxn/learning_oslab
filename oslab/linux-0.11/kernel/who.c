/*
write by lxn, 2024.09.18
*/
#define __LIBRARY__
#include <linux/kernel.h>
#include <../include/unistd.h>
#include <asm/segment.h>
#include <errno.h>
#include <string.h>

char msg[24]; //23个字符 + '\0'(结束符) = 24

/*
function : 将name的内容拷贝到msg.name中，长度不超过23个字符
return 拷贝的字符数，如果name的字符个数超过了23个，则返回-1, 同时将erron设置为EINVAL

*/
int sys_iam(const char* name){
    printk("sys_iam calling...\n");
    int i;
    //临时存储
    char temp[30];
    for(i=0; i<30; i++){
        //从用户态内存取得数据
        temp[i] = get_fs_byte(name+i);
        if(temp[i] == '\0'){
            break; //存储字符串结束
        }
    }

    i = 0;
    while(i<30 && temp[i] != '\0'){i++;}
    int len = i;
    //字符长度大于23个
    if(len > 23){
        return -(EINVAL);
    }
    strcpy(msg, temp);
    return i;
}


/*
function: 将msg的内容拷贝name指定的用户空间地址中，确保不会对name越界访问（name的大小由size指定）
return: 拷贝的字符数，如果size小于需要的空间，则返回-1，同时将erron设置为 EINVAL
*/
int sys_whoami(char* name, unsigned int size){
    printk("sys_whoami calling \n");
    //检查msg的长度
    int len = 0;
    for(;msg[len] != '\0'; len++);
    if(len > size){
        return -(EINVAL);
    }
    //拷贝msg到name
    int i = 0;
    //msg 输出至 name
    for(i=0; i<len; i++){
        put_fs_byte(msg[i], name+i);
        if(msg[i] == '\0'){
            break; //字符串结束
        }
    }
    return i;
}

