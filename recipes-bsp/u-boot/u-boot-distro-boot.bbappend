FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://uEnv.txt.in \
"

do_install () {
    sed -e 's/@@KERNEL_BOOTCMD@@/${KERNEL_BOOTCMD}/' \
        -e 's/@@KERNEL_IMAGETYPE@@/${KERNEL_IMAGETYPE}/' \
        -e 's/@@SOTA_MAIN_DTB@@/${SOTA_MAIN_DTB}/' \
        ${WORKDIR}/uEnv.txt.in > ${WORKDIR}/uEnv.txt
    install -d ${D}${libdir}/ostree-boot
    install -m 0644 ${WORKDIR}/uEnv.txt ${D}${libdir}/ostree-boot/
}

do_deploy_append_rpi() {
    install -d ${DEPLOYDIR}/
    install -m 0664 ${S}/boot.scr ${DEPLOYDIR}/
}

PACKAGES = "ostree-uboot-env"
FILES_ostree-uboot-env = "${libdir}/ostree-boot/uEnv.txt"
