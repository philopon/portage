# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-r3 user

DESCRIPTION="Chinachu is an Open Source Digital Video Recorder System for Linux."
HOMEPAGE="https://chinachu.moe/"
EGIT_REPO_URI="https://github.com/kanreisa/Chinachu"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="media-libs/x264"
RDEPEND="${DEPEND}"

INS_INTO=/opt/chinachu

pkg_setup(){
	enewgroup chinachu 10772
	enewuser  chinachu 10772 /bin/bash $INS_INTO "chinachu,video"
}

src_compile(){
	echo 1 | ./chinachu installer
}

src_install(){
	insinto $INS_INTO

	cp -R `ls -A` ${D}/$INS_INTO

	fowners -R chinachu:chinachu $INS_INTO

	doinitd "${FILESDIR}/chinachu-wui"
	doinitd "${FILESDIR}/chinachu-operator"

	dosym $INS_INTO/chinachu /usr/bin/chinachu
}
