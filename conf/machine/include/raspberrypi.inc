WKS_FILE_sota_rpi = "torizon-rpi-sota.wks"
WKS_FILE_DEPENDS_remove_rpi = "virtual/dtb"

OSTREE_KERNEL_ARGS_rpi = "console=ttyS0,115200 root=LABEL=otaroot rootfstype=ext4"
#OSTREE_BOOTLOADER_rpi = "grub"
EFI_PROVIDER_rpi = "grub-efi"
SOTA_CLIENT_FEATURES_remove_rpi = "ubootenv"

IMAGE_FSTYPES_remove_rpi = "tar.bz2 ext3 teziimg"

#hostname_pn-base-files = "${MACHINE}"
#CORE_IMAGE_BASE_INSTALL_remove = "set-hostname"

PREFERRED_PROVIDER_u-boot-default-script_rpi = "u-boot-distro-boot"
PREFERRED_PROVIDER_virtual/dtb_rpi = ""

KERNEL_BOOTCMD_rpi_forcevariable = "bootz"
KERNEL_IMAGETYPE_rpi_forcevariable = "zImage"
OSTREE_KERNEL_rpi_forcevariable = "${KERNEL_IMAGETYPE}"
KERNEL_BOOTCMD_aarch64_rpi = "booti"
KERNEL_IMAGETYPE_aarch64_rpi = "Image.gz"

RPI_EXTRA_CONFIG_append = " \nenable_uart=1\n "

# IMAGE_BOOT_FILES_remove = "${@make_dtb_boot_files(d)}"

PREFERRED_VERSION_linux-raspberrypi = "5.4%"
