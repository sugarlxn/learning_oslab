# learning oslab

这是哈工大计算机科学与技术学院李治军老师的操作系统课程实验环境

我们使用docker 来构建oslab的可运行环境，在wsl2上测试通过，欢迎大家在更多的环境上测试该docker image。<(￣︶￣)↗[GO!]>>

# get start
## build image 
1. 从[Dockerfile](./Dockerfile)中执行构建, 我们默认你已经安装好docker，无论通过docker desktop 或者在linux主机上
```shell
docker build -t lxn_oslab:1.0 .
```

2. 从dockerhub中直接拉取我们构建好的镜像(正在提供支持，coming soon)
```shell
docker pull lxn1234/lxn_oslab:1.0 
```
> Dockerfile 的构建参考[林夕`](https://blog.csdn.net/qq_45923646/article/details/120575616) 大佬的环境配置方法，感谢大佬写的文档

## run container

1. 首先，我们需要在主机上执行`xhost +` 
2. 通过`ifconfig` 获取主机的IP地址，记为`host_ip` 
3. 将`host_ip` 填入文件[run_oslab.sh](./run_oslab.sh) 中
```shell
# Run the OSLab programs
docker run --rm -it --network=host --name oslab  \
    --env="DISPLAY=<host_ip>:0.0" \
```
4. 运行oslab容器
```shell
./run_oslab.sh
```

## test
1. 安装[Xlaunch](https://sourceforge.net/projects/vcxsrv/),(在windows 上使用docker desktop 需要Xlaunch 可视化容器里面的GUI窗口)

下载安装Xluanch，使用默认配置启动xlaunch即可

> linux 环境下不需要安装这个Xlaunch，在容器里面使用`export DISPLAY=<host_ip>:0.0` 即可

2. 我们可以通过一个`x11-apps` 的小插件，来测试容器中的窗口转发, 以下操作我们在容器中进行
```shell
apt-get install -y x11-apps
xeyes
```
如果出现两只眼睛的窗口，则说明容器内部的窗口转发配置成功


![image1](./image/oslab1.png)

2. 解压并编译oslab
```shell
tar -zxvf hit-oslab.tar.gz -C /root/
cd oslab/linux-0.11
make all -j 2
```
编译成功

3. 运行oslab操作系统
```shell
cd oslab
./run
```
将会出现操作系统加载窗口

![image2](./image/oslab2.png)

