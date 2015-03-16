# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils linux-mod

DESCRIPTION="Network Adapter Driver for PCI-E Gigabit Network Connections under Linux"
HOMEPAGE="https://downloadcenter.intel.com/ja/download/15817"
SRC_URI="http://downloadmirror.intel.com/15817/eng/e1000e-3.1.0.2.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
BUILD_TARGETS="clean default"
MODULE_NAMES="e1000e(ethernet/drivers:${S}/src:${S}/src)"

DEPEND=""
RDEPEND="${DEPEND}"

src_compile(){
	cd ${S}/src
	emake
}

src_install(){
	linux-mod_src_install
}
