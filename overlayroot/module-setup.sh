#!/bin/bash
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-
# ex: ts=8 sw=4 sts=4 et filetype=sh

check() {
    require_binaries /bin/mount
    require_binaries /bin/umount
    require_binaries /sbin/mkfs.xfs
}

depends() {
    return 0
}

installkernel() {
    instmods overlay
    instmods "=fs/overlayfs"
}

install() {
    dracut_install /bin/mount
    dracut_install /bin/umount
    dracut_install /sbin/mkfs.xfs
    inst_hook pre-pivot 10 "$moddir/mount-overlayroot.sh"
}
