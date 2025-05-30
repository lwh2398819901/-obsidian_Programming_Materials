---
tags:
  - "#CodeBuild"
  - "#linux"
  - "#windows"
  - "#ai生成"
---


**<font color="#ff0000">提示：部分内容由 chatgpt 参与创作，本人不保证真实、准确性，仅经过本人审核，对于资料真伪请自行判别</font>**


前言：

我不得不承认，我搞不懂cmake ,现在 我打算在这里从新学一遍，趁着目前有时间 工作不忙的时候（摸鱼(*^_^*)）

## make
make是一个构建工具,它可以根据makefile文件中的规则来自动化构建项目。主要功能包括:

1. 自动化编译
- 根据源文件的依赖关系,自动判断哪些文件需要重新编译
- 只编译发生变化的文件,避免全部重新编译
- 支持并行编译,提高编译速度

2. 项目管理
- 通过makefile定义编译规则和依赖关系
- 管理头文件、源文件、目标文件之间的依赖
- 支持多目标、多目录项目的构建

3. 基本语法
- 目标: 依赖 (命令)




## cmake
![[Pasted image 20220926222718.png]]
### 现代cmake与古代cmake
古代cmake 2.x
现代cmake 3.x
```cmake
# 古代
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j4
make install

# 现代
cmake -B build -DCMAKE_BUILD_TYPE=Release # 自动创建build文件夹  这里-B 制定文件夹名字 不过一般都是build
cmake --build build --parallel 4 # 等同于 cd build;cmake ..;make -j4
cmake --build build --target install #等同于 cd build;cmake ..; make install

```


## 参考链接
[全网最细的CMake教程！(强烈建议收藏)](https://zhuanlan.zhihu.com/p/534439206)

[CMAKE_INSTALL_PREFIX无效的解决方案](https://blog.csdn.net/baidu_40840693/article/details/103081909)

[静态动态库----CMake学习笔记二](https://zhuanlan.zhihu.com/p/149790907)


#  简介及构建
## learn 1  cmake构建项目流程
![](附件/现代C++_%20CMake简明教程_哔哩哔哩_bilibili_8'23.494''.jpg)
![](附件/现代C++_%20CMake简明教程_哔哩哔哩_bilibili_8'36.479''.jpg)
![](附件/现代C++_%20CMake简明教程_哔哩哔哩_bilibili_10'29.390''.jpg)
![](附件/现代C++_%20CMake简明教程_哔哩哔哩_bilibili_14'9.582''.jpg)

## learn 2 windows下构建cmake工程
![](附件/1.2在windows下使用cmake（gcc、msvc）_哔哩哔哩_bilibili_2'36.490''.jpg)

## learn 3 linux 下构建cmake
1. apt 安装
```
 sudo apt install cmake
```
2. 源码安装
![](附件/1.3在linux下使用CMake_哔哩哔哩_bilibili_1'57.162''.jpg)

# 语法
## learn 4 cmake语法 message
![](附件/2.1%20CMake语法%20message_哔哩哔哩_bilibili_0'42.284''.jpg)

![](附件/2.1%20CMake语法%20message_哔哩哔哩_bilibili_0'59.323''.jpg)

![](附件/2.1%20CMake语法%20message_哔哩哔哩_bilibili_1'18.081''.jpg)

使用cmake直接运行某个.cmake文件

```
cmake -P *.cmake
```

可使用附件中的示例

![](附件/cmake/02%20语法/messages.cmake)


## learn 5 变量操作 set, list
![](附件/2.2%20Cmake语法set与list_哔哩哔哩_bilibili_0'11.172''.jpg)


### set
![](附件/2.2%20Cmake语法set与list_哔哩哔哩_bilibili_1'1.317''.jpg)

### list