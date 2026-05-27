# --- Fedora Live OS Blueprint ---
lang en_US.UTF-8
keyboard us
timezone US/Eastern
authselect --enableshadow --passalgo=sha512
selinux --enforcing
firewall --enabled --service=ssh

# --- Enable Initial Setup UI ---
firstboot --enable
services --enabled=network,sshd,gdm,initial-setup

# --- Graphical Interface Setup ---
xconfig --startxonboot

# --- Clear existing partitions ---
zerombr
clearpart --all --initlabel
part / --size=8192 --fstype=ext4

# --- Software Packages to Pre-install ---
%packages
@core
@base-x
@xfce-desktop
@fonts
firefox
nano
git

# Your Custom Developer Tools
nodejs
npm
python3
python3-pip

# Required to display the user setup screen on first boot
initial-setup
initial-setup-gui

# --- CRITICAL LIVE OS BOOT PACKAGES ---
kernel
dracut-live
grub2-efi-x64
grub2-pc
syslinux
shim-x64

-thunderbird
-evince
%end
