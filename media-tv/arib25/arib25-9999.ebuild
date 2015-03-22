EAPI=5

inherit eutils git-r3

DESCRIPTION="arib25 library"
HOMEPAGE="https://github.com/stz2012/libarib25"
EGIT_REPO_URI="https://github.com/stz2012/libarib25"
LICENSE=""

SLOT="0"
KEYWORDS="amd64"

src_prepare() {
	epatch "${FILESDIR}/${PV}/disable-ldconfig.patch"
}

src_compile() {
	emake
}

src_install() {
	mkdir -p ${D}/usr/{lib,bin}
	emake PREFIX="${D}/usr" install
}
