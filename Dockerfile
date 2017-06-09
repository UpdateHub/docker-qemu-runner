FROM alpine:3.6

MAINTAINER https://github.com/OSSystems

# Install QEMU/KVM
RUN apk add --no-cache \
        qemu-system-x86_64 ovmf

ADD scripts/updatehub-qemu ./
ADD scripts/entrypoint ./

RUN chmod +x entrypoint updatehub-qemu

VOLUME ["/state"]

EXPOSE 22
ENTRYPOINT ["./entrypoint"]
