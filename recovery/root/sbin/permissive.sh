#!/sbin/sh

setenforce 0

(
  mknod /dev/fb0 c 29 0
) &> /dev/null;

exit 0
