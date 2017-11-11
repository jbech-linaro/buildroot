#!/usr/bin/env bash

BOARD_DIR="$(dirname $0)"
OPTEE=/mnt/sshd/devel/optee_projects/qemu

CP=/usr/bin/cp

mkdir -p $BOARD_DIR/rootfs_overlay/{bin,lib/optee_armtz}

# OP-TEE Examples
$CP -f $OPTEE/optee_examples/out/ca/* $BOARD_DIR/rootfs_overlay/bin/
$CP -f $OPTEE/optee_examples/out/ta/* $BOARD_DIR/rootfs_overlay/lib/optee_armtz/

# OP-TEE xtest
$CP -f $OPTEE/optee_test/out/xtest/xtest $BOARD_DIR/rootfs_overlay/bin/
$CP -f $OPTEE/optee_test/out/ta/*/*.ta $BOARD_DIR/rootfs_overlay/lib/optee_armtz/

# OP-TEE client
$CP -aL $OPTEE/optee_client/out/export/{bin,lib} $BOARD_DIR/rootfs_overlay/

# TODO - Strip rootfs_overlay{bin,lib}
