FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:${THISDIR}/u-boot-toradex:"

SRC_URI_append = " \
    file://bootcommand.cfg \
    file://bootcount.cfg \
    file://bootlimit.cfg \
    file://fitimage.cfg \
"
