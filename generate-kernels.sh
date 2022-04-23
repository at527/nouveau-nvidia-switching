#!/bin/sh

KERNEL=$(grubby --default-kernel)

NVIDIA_TITLE=$(echo $(grubby --info=DEFAULT \
        | grep title \
        | sed s/title=// \
        | sed s/\"//g) \
        "- Nvidia")
NOUVEAU_TITLE=$(echo $(grubby --info=DEFAULT \
        | grep title \
        | sed s/title=// \
        | sed s/\"//g) \
        "- Nouveau")

grubby --add-kernel=$KERNEL \
        --copy-default \
        --args="rd.driver.blacklist=nouveau \
                modprobe.blacklist=nouveau \
                nvidia-drm.modeset=1" \
        --title="${NVIDIA_TITLE}"

grubby --add-kernel=$KERNEL \
        --copy-default \
        --remove-args="rd.driver.blacklist=nouveau \
                modprobe.blacklist=nouveau \
                nvidia-drm.modeset=1" \
        --title="${NOUVEAU_TITLE}" \
        --make-default