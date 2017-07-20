# Copyright (C) 2017 O.S. Systems Sofware LTDA
#
# SPDX-License-Identifier:     GPL-2.0

FROM alpine:3.6

MAINTAINER https://github.com/OSSystems

# Install QEMU/KVM
RUN apk add --no-cache \
        curl \
        xz \
        qemu-system-arm \
        qemu-system-i386 \
        qemu-system-x86_64

# Download ovmf from Arch Linux as it contains binaries for i386 and
# x86-64
RUN curl http://ftp5.gwdg.de/pub/linux/archlinux/extra/os/x86_64//ovmf-1:r21243.3858b4a1ff-1-any.pkg.tar.xz > ovmf-1-r21243.3858b4a1ff-1-any.pkg.tar.xz
RUN echo "bef6f80793cc56fa3f3ff61dac22448c  ovmf-1-r21243.3858b4a1ff-1-any.pkg.tar.xz" | md5sum -c && tar -xJf ovmf-1-r21243.3858b4a1ff-1-any.pkg.tar.xz && rm ovmf-1-r21243.3858b4a1ff-1-any.pkg.tar.xz

ADD scripts/updatehub-qemu ./
ADD scripts/entrypoint ./

RUN chmod +x entrypoint updatehub-qemu

VOLUME ["/state"]

EXPOSE 22
ENTRYPOINT ["./entrypoint"]
