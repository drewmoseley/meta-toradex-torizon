FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-2018.03:"

SRC_URI_append += " \
       file://0001-define-bootcount-related-variables-to-make-bootcount.patch \
"

do_configure_append() {
# Strip leading and trailing whitespace, then newline divide.
        TORIZON_UBOOT_MACHINE="$(echo "${UBOOT_MACHINE}" | sed -r 's/(^\s*)|(\s*$)//g; s/\s+/\n/g')"

        if [ -z "$TORIZON_UBOOT_MACHINE" ]; then
                bbfatal "Did not find a machine specified in UBOOT_MACHINE"
                exit 1
        fi

        MACHINE_COUNT=$(echo "$TORIZON_UBOOT_MACHINE" | wc -l)
        if [ "$MACHINE_COUNT" -ne 1 ]; then
                bbnote "Found more than one machine specified in UBOOT_MACHINE."
        fi

        for CONFIG_FILE in $TORIZON_UBOOT_MACHINE; do
                echo "CONFIG_BOOTCOUNT_LIMIT=y" >> ${S}/configs/${CONFIG_FILE}
                echo "CONFIG_BOOTCOUNT_ENV=y" >> ${S}/configs/${CONFIG_FILE}
        done
}

