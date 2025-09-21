#!/sbin/sh

setenforce 0

(
  mknod /dev/fb0 c 29 0
  mknod /dev/mtk_disp_mgr c 242 0
  mknod /dev/input c 13 0
  ) &> /dev/null;

exit 0
