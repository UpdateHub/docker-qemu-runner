# Copyright (C) 2017-2020 O.S. Systems Sofware LTDA
#
# SPDX-License-Identifier:     GPL-2.0

FROM alpine:3.12

MAINTAINER https://github.com/OSSystems

# Install QEMU/KVM
RUN apk add --no-cache \
        ovmf \
        qemu-system-arm \
        qemu-system-x86_64

ADD scripts/updatehub-qemu ./
ADD scripts/entrypoint ./

RUN chmod +x entrypoint updatehub-qemu

VOLUME ["/state"]

EXPOSE 22
ENTRYPOINT ["./entrypoint"]
