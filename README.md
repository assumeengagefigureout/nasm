# NASM 汇编练习仓库（x86 实模式：引导扇区 & .COM）

这是一个面向在 Linux 下安全练习 8086/实模式汇编的小项目。仓库包含：

- 一个最小的 DOS `.COM` 程序示例：`hello.asm`（生成 `hello.com`，可在 DOSBox 或虚拟机中运行）
- 用于容器化开发的 `Dockerfile` 和 `.devcontainer`，方便隔离开发环境（包含 nasm、qemu、dosbox 等）。

目标：提供一个可重复、隔离的开发/学习环境，让你不必在宿主系统上安装旧式工具即可练习实模式汇编。

## 快速开始

先安装本机需要的工具（若使用仓库自带的 Docker/devcontainer，可跳过本节）：

Linux（Debian/Ubuntu）示例：

```sh
sudo apt update
sudo apt install -y nasm qemu-system-i386 dosbox dd
```



编写简单的 DOS 程序 
创建一个汇编文件（比如 hellp.asm）：
nasm -f bin test.asm -o test.com

使用 DOSBox 调试
直接启动 DOSBox 的调试器：

在 DOSBox 调试器中，你可以：

dosbox  -c "mount c ." -c "c:" -c "  debug test.com"


按 t 键：单步执行
按 r 键：查看所有寄存器
按 d 键：查看内存内容
按 u 键：查看反汇编代码
按 q 键：退出调试

编写汇编代码（.asm 文件）
使用 nasm 编译
用 DOSBox 的调试器调试
要退出 DOSBox 窗口，可以按 Ctrl+F9 或者在 DOSBox 命令行输入 exit。
