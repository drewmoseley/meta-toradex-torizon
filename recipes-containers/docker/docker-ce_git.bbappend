FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRCREV_docker = "5eb3275d4006e4093807c35b4f7776ecd73b13a7"
SRCREV_libnetwork = "55e924b8a84231a065879156c0de95aefc5f5435"

DOCKER_VERSION = "19.03.14-ce"

# The patch that adds configurable maximum of download attempts originates
# from https://github.com/docker/docker-ce/commit/74d15487080abcfce9d9359a746620a7f7c06c5b
SRC_URI:append = " \
    file://dockerd-daemon-use-default-system-config-when-none-i.patch \
    file://cli-config-support-default-system-config.patch \
    file://dockerd-daemon-configurable-max-download-attempts.patch \
"

do_install:append() {
	# systemd[1]: /usr/lib/systemd/system/docker.socket:6: ListenStream= references
	# a path below legacy directory /var/run/, updating /var/run/docker.sock → /run/docker.sock;
	# please update the unit file accordingly.
	sed -i -e 's#ListenStream=/var#ListenStream=#' ${D}${systemd_system_unitdir}/docker.socket
}

require docker-torizon.inc
