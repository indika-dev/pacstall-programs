#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="uwufetch"
version="1.7"
pkgdir="/usr/src/pacstall/${name}"
url="https://github.com/TheDarkBug/${name}/archive/refs/tags/${version}.zip"
description="A meme system info tool for Linux, based on nyan/uwu trend on r/linuxmasterrace."
build_depends="gcc"
optdepends=("viu: image preview"
  "lshw: hardware info")
breaks="${name}-git ${name}-bin"
hash="1f2f4b17c368e4e097323afc14386b30d6c7b7aa626565ef6902ff6e37b34dab"

prepare() {
  # Make nessesary directories
  sudo mkdir -p "${pkgdir}"/usr/bin
  sudo mkdir -p "${pkgdir}"/usr/lib
  sudo mkdir -p "${pkgdir}"/usr/share/man/man1
}

build() {
  # Build required files
  make -j"$(nproc)" build DESTDIR="${pkgdir}"
  make -j"$(nproc)" man DESTDIR="${pkgdir}"
}

install() {
  # Install license
  sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${name}"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${name}"

  # Install uwufetch
  sudo make install DESTDIR="${pkgdir}"
}

removescript() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${name}"
  sudo rm -rf "/usr/share/doc/${name}"
}
# vim:set ft=sh ts=2 sw=2 et:
