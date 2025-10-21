# Dockerfile - 8086 assembly dev container
FROM ubuntu:22.04
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000
ENV DEBIAN_FRONTEND=noninteractive


# 安装工具：nasm, dosbox, qemu-system-i386, ndisasm, mtools, dosemu
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    nasm \
    dosbox \
    qemu-system-i386 \
    mtools \
    git \
    vim \
    less \
    build-essential \
    ca-certificates \
    x11-apps \
    && rm -rf /var/lib/apt/lists/*


# 创建非 root 用户（与宿主 UID 对应，Dev Containers 会替换 ARG）
RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} \
    && passwd -d ${USERNAME} || true


WORKDIR /workspace


# 默认以非交互 shell 启动
CMD ["/bin/bash"]
