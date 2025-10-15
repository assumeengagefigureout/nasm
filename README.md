# NASM 汇编练习仓库（x86 实模式：引导扇区 & .COM）

这是一个面向在 Linux 下安全练习 8086/实模式汇编的小项目。仓库包含：

- 一个简单的引导扇区示例：`boot.asm`（生成 `boot.bin`，可写入软盘镜像并用 QEMU 启动）
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

构建并运行示例：

1) 生成引导扇区二进制（boot.bin）

```sh
nasm -f bin boot.asm -o boot.bin
```

2) 创建一个空的 1.44MB 软盘镜像并把 `boot.bin` 写入扇区 0：

```sh
dd if=/dev/zero of=floppy.img bs=512 count=2880
dd if=boot.bin of=floppy.img conv=notrunc
```

3) 使用 QEMU 启动软盘镜像（将会显示 BIOS 输出）：

```sh
qemu-system-i386 -fda floppy.img -boot a
```

你应该能看到引导程序打印的消息（由 `boot.asm` 中的 BIOS int 0x10 实现）。

运行 `.COM` 程序（hello.com）：

```sh
nasm -f bin hello.asm -o hello.com
```

在 DOSBox 中运行：

```sh
# 将当前目录挂载为 C:，运行 hello.com，然后退出
dosbox -c "mount c ." -c "c:" -c "hello.com" -c "exit"
```

或者，将 `hello.com` 放入软盘镜像并在 QEMU 的 DOS 环境（或某些引导盘）中运行 —— 本仓库以最小示例为主，推荐使用 DOSBox 来快速运行 `.COM` 文件。

## 使用 Docker / Dev Container

仓库提供了 `Dockerfile`（和 `.devcontainer`），方便在隔离的容器中运行 nasm、qemu、dosbox 等工具。

示例：构建并运行容器（在仓库根目录）：

```sh
docker build -t nasm-dev .
docker run --rm -it -v "$PWD":/workspace -w /workspace nasm-dev
```

在容器内，你可以直接使用上面的 `nasm` / `qemu` / `dosbox` 命令来构建和测试。

如果你使用 VS Code 的 Dev Containers 功能，打开仓库并选择 "Reopen in Container"，它会使用 `.devcontainer` 配置来启动开发容器。

## 文件说明

- `boot.asm` — 引导扇区示例，打印短消息后停止（适合写入软盘镜像的第一个扇区）。
- `boot.bin` — 由 `boot.asm` 生成的二进制（已包含 boot signature）。
- `hello.asm` — 最小 DOS `.COM` 程序示例，使用 INT 0x21 打印字符串。
- `hello.com` — 由 `hello.asm` 生成的可执行文件。
- `floppy.img` — （可选）仓库中可能已有的软盘镜像文件，或按上文命令创建。
- `Dockerfile`, `.devcontainer/` — 用于创建开发容器。

## 调试与开发建议

- 引导程序：使用 QEMU 的 `-S -gdb tcp::1234` 配合 `gdb` 调试；注意需使用适合实模式/二进制的 gdb 脚本或插件来方便查看寄存器和内存。
- DOS `.COM`：建议使用 DOSBox 的内置调试命令或在现代调试器里使用 emulators（例如 Bochs）来单步跟踪。




