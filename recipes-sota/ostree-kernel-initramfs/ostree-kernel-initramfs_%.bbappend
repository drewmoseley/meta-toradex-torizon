PACKAGES_prepend = "ostree-devicetree-overlays "
ALLOW_EMPTY_ostree-devicetree-overlays = "1"
FILES_ostree-devicetree-overlays = "${nonarch_base_libdir}/modules/*/dtb/*.dtbo ${nonarch_base_libdir}/modules/*/dtb/overlays.txt"

DEPLOY_DIR_OVERLAY = "${DEPLOY_DIR_IMAGE}/overlays/"
DEPLOY_DIR_OVERLAY_rpi = "${DEPLOY_DIR_IMAGE}/"

do_install_append () {
    if [ ${@ oe.types.boolean('${OSTREE_DEPLOY_DEVICETREE}')} = True ]; then
        install -d $kerneldir/dtb/overlays
        if [ ! -e ${DEPLOY_DIR_IMAGE}/overlays/none_deployed ]; then
            install -m 0644 ${DEPLOY_DIR_OVERLAY}/*.dtbo $kerneldir/dtb/overlays
            if [ -e ${DEPLOY_DIR_IMAGE}/overlays.txt ]; then
                install -m 0644 ${DEPLOY_DIR_IMAGE}/overlays.txt $kerneldir/dtb
            fi
        fi
    elif [ "${KERNEL_IMAGETYPE}" = "fitImage" ]; then
        if [ -e ${DEPLOY_DIR_IMAGE}/overlays.txt ]; then
            install -d $kerneldir/dtb
            install -m 0644 ${DEPLOY_DIR_IMAGE}/overlays.txt $kerneldir/dtb
        fi
    fi
}
do_install[depends] += "${@'virtual/dtb:do_deploy' if '${PREFERRED_PROVIDER_virtual/dtb}' else ''}"
