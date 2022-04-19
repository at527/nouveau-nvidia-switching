# nouveau-nvidia-switching
# Notes on switching between Nouveau and Nvidia on Fedora 34

```
grubby --add-kernel $(grubby --default-kernel) --copy-default --args="rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1" --title "Nvidia"
```

```
grubby --set-default INDEX
```


1. Generate Nvidia Kernel with name from default nvidia kernel

```grubby --add-kernel /boot/vmlinuz-5.16.18-200.fc35.x86_64 --copy-default --args="rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1" --title "Fedora Linux (5.16.18-200.fc35.x86_64) 35 (Workstation Edition) - Nvidia"```

2. Generate Nouveau Kernel with name and args, set default

```grubby --add-kernel /boot/vmlinuz-5.16.18-200.fc35.x86_64 --copy-default --remove-args="rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1" --title "Fedora Linux (5.16.18-200.fc35.x86_64) 35 (Workstation Edition) - Nouveau" --set-default```
