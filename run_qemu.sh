#!/usr/bin/env bash
QEMU=/mnt/sshd/devel/optee_projects/qemu/qemu/arm-softmmu/qemu-system-arm

$QEMU -machine virt -nographic \
	-kernel /mnt/sshd/devel/optee_projects/qemu/linux/arch/arm/boot/zImage \
	-append "console=ttyAMA0" \
	-initrd output/images/rootfs.cpio.gz \
	-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic \
	-redir tcp:2222::22
