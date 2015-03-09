EAPI=5

inherit eutils git-r3 autotools

DESCRIPTION="recpt1"
HOMEPAGE="https://github.com/stz2012/recpt1"
EGIT_REPO_URI="https://github.com/stz2012/recpt1"
LICENSE=""

SLOT="0"
KEYWORDS="~amd64"

RDEPEND="media-tv/arib25"
DEPEND="${RDEPEND}"

src_configure() {
	cd ${S}/recpt1
	./autogen.sh
	./configure --enable-b25 --prefix="${D}/usr"
}

src_compile() {
	cd ${S}/recpt1
	make
}

src_install() {
	cd ${S}/recpt1
	mkdir -p ${D}/usr/bin
	emake install
}
