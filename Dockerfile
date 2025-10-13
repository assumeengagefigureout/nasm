FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    nasm \
    dosbox \
    qemu-system-x86 \
    mtools \
    less \
    build-essential \
    vim \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /work
VOLUME ["/work"]
CMD ["/bin/bash"]

