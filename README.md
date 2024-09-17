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
1. 我们可以通过一个`x11-apps` 的小插件，来测试容器中的窗口转发, 以下操作我们在容器中进行
```shell
apt-get install -y x11-apps
xeyes
```
如果出现两只眼睛的窗口，则说明容器内部的窗口转发配置成功

![image1](./image/oslab1.png)

2. 解压并编译oslab
```shell
tar -zxvf hit-oslab.tar.gz
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

