EAPI=5

inherit eutils git-r3 linux-mod

DESCRIPTION="pt3 driver"
HOMEPAGE="https://github.com/m-tsudo/pt3"
EGIT_REPO_URI="https://github.com/m-tsudo/pt3"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64"
BUILD_TARGETS="all"
MODULE_NAMES="pt3_drv(kernel/drivers/video:${S}:${S})"

RDEPEND="sys-fs/udev"
DEPEND="${RDEPEND} virtual/pkgconfig"

src_compile() {
	linux-mod_src_compile
}

src_install() {
	local udevdir="$(pkg-config --variable=udevdir udev)"
	insinto "${udevdir}"/rules.d
	doins etc/99-pt3.rules
	linux-mod_src_install

	insinto /usr/lib/modules-load.d/
	doins "${FILESDIR}"/pt3.conf
}
