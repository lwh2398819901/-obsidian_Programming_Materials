**<font color="#ff0000">提示：部分内容由 chatgpt 参与创作，本人不保证真实、准确性，仅经过本人审核，对于资料真伪请自行判别</font>**

## 学习资源
狂神说 B 站视频：  
[1、Docker学习大纲_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1og4y1q7M4?p=1)

[Docker容器学习笔记一_￠05fc3unxl￠-CSDN博客](https://blog.csdn.net/qq_41822345/article/details/107123094)

[Docker容器学习笔记二_狂神docker视频学习笔记-CSDN博客](https://blog.csdn.net/qq_41822345/article/details/107123141)  

学习 docker：  
[Docker 教程 | 菜鸟教程](https://www.runoob.com/docker/docker-tutorial.html)  
使用 docker：  
[Play with Docker](https://labs.play-with-docker.com/)

官网：  
[docker官网](https://www.docker.com/)

[docker仓库](http://www.hub.docker.com/)

[Docker Docs](https://docs.docker.com/)



## 安装

- 环境准备

Linux要求内核3.0以上

- 命令行安装

**ubuntu**
```bash
sudo apt install docker-ce
```

**centos**
<font color="#ff0000">以下内容由 AI 参与或全部创作，本人校对</font>
```bash
sudo yum install -y yum-utils device-mapper-persistent-data lvm2 sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo sudo yum install docker-ce docker-ce-cli containerd.io
```

## 设置
镜像加速：

**ubuntu**

```bash
mkdir /etc/docker/
touch /etc/docker/daemon. json 
{"registry-mirrors": ["https://registry.cn-hangzhou.aliyuncs.com"]} # 阿里镜像

sudo systemctl restart docker
```


**centos**
与 ubuntu 类似，可能只有目录需要注意