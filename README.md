# nouveau-nvidia-switching
# Notes on switching between Nouveau and Nvidia on Fedora 34

```
grubby --add-kernel $(grubby --default-kernel) --copy-default --args="rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1" --title "Nvidia"
```
