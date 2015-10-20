#!/bin/bash -eux
# Install the Parallels Tools

SSH_USER=${SSH_USERNAME:-vagrant}
SSH_USER_HOME=${SSH_USER_HOME:-/home/${SSH_USER}}

if [[ $PACKER_BUILDER_TYPE =~ parallels ]]; then
    echo "==> Installing Parallels guest additions"
    # Assume that we've installed all the prerequisites:
    # kernel-headers-$(uname -r) kernel-devel-$(uname -r) gcc make perl
    # from the install media via ks.cfg

    PARALLELS_TOOLS_ISO=prl-tools-lin.iso
    mkdir -p /media/cdrom
    mount -o loop $SSH_USER_HOME/$PARALLELS_TOOLS_ISO /media/cdrom
    /media/cdrom/install --install-unattended-with-deps --progress
    umount /media/cdrom
    
    rm -rf $SSH_USER_HOME/$PARALLELS_TOOLS_ISO

    echo "==> Removing packages needed for building guest tools"
    yum -y remove gcc cpp libmpc mpfr kernel-devel kernel-headers perl
fi
