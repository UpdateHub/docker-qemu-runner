# UpdateHub QEMU runner Docker image [![Build Status](https://travis-ci.org/UpdateHub/docker-qemu-runner.svg?branch=master)](https://travis-ci.org/UpdateHub/docker-qemu-runner)

UpdateHub provides a generic and safe Firmware Over-The-Air agent for
Embedded and Industrial Linux-based devices. This repository provides
a QEMU runner for UpdateHub test and development.

Features
--------

* x86-64 emulation
* fixed and dynamic MAC address setting
* persistent image support

Usage
-----

The following environmnts are available:

* IMAGE=`<image name>` (required)
* MAC=`<mac address>` (optional)

The `IMAGE` environmnt points to the image name to be loaded by the
virtual machine (e.g: `updatehub-image-minimal-uh-qemu-x86-64.wic`). The
image is loaded from the `/state` volume so an example usage is:

```
docker run --rm \
       -v $PWD:/state \
       -e IMAGE=updatehub-image-minimal-uh-qemu-x86-64.wic \
       -it updatehub/qemu-runner
```
