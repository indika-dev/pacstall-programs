name="ttf-fira-sans"
pkgname="ttf-fira-sans"
version="4.202"
gives="${pkgname}"
breaks="${pkgname}"
repology=("project: font-fira")
replace="${gives}"
url="https://fonts.google.com/download?family=Fira%20Sans"
description="Mozilla's typeface used in Firefox OS"
hash="5a3059fbde784f57a58ffb55e15660ae6022c724ecbc468f58c0aaa2311c05f9"
license="OFL-1.1"
maintainer="heyzsh <haidarzsh@gmail.com>"
prepare() {
    unzip * -d .
}

build() {
    true
}

install() {
    sudo install -d "${pkgdir}"/usr/share/fonts/TTF
    sudo install -Dm644 "${SRCDIR}"/*.ttf "${pkgdir}"/usr/share/fonts/TTF
    sudo install -Dm644 "${SRCDIR}"/OFL.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
