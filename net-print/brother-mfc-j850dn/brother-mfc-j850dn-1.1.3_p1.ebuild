# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit rpm

printer_model=mfcj850dn
printer_name=`echo $printer_model | tr '[a-z]' '[A-Z]'`

MY_PV=${PV/_p/-}
S=$WORKDIR

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="http://download.brother.com/welcome/dlf100844/${printer_model}lpr-${MY_PV}.i386.rpm \
  http://download.brother.com/welcome/dlf100846/${printer_model}cupswrapper-${MY_PV}.i386.rpm"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE="cups"

DEPEND="net-print/cups"
RDEPEND="${DEPEND}"

src_unpack() {
    if [ "${A}" != "" ]; then
        rpm_src_unpack
    fi
}

src_install(){
	dodir /usr/share/cups/model/Brother /var/spool/lpd/$printer_model
	cp -R "${S}/opt" "${D}/" || die "Install failed!"
	cp -R "${S}/usr" "${D}/" || die "Install failed!"

	dosym /opt/brother/Printers/$printer_model/cupswrapper/brother_${printer_model}_printer_en.ppd /usr/share/cups/model/Brother/brother_${printer_model}_printer_en.ppd

	fowners lp:lp /var/spool/lpd/$printer_model
	fperms  700 /var/spool/lpd/$printer_model

	exeinto /usr/libexec/cups/filter
	doexe $FILESDIR/brlpdwrapper${printer_model}
}
