name="grive2"
pkgname="grive2"
description="Google Drive client with support for new Drive REST API and partial sync"
version="0.5.1"
url="https://github.com/vitalif/grive2/archive/v${version}.tar.gz"
build_depends="cmake libgcrypt20-dev libyajl-dev libboost-all-dev libcurl4-openssl-dev libexpat1-dev libcppunit-dev binutils-dev debhelper zlib1g-dev dpkg-dev pkg-config"
depends="libgcrypt20 libyajl2 libboost-all-dev libcurl4 libexpat1"
replace="grive"
hash="9940bcd3e5a3ffd32b91477fba8ba1ca3e0a3a72e5ffa9c6d524db87951fdbbb"
patch=("https://github.com/vitalif/grive2/commit/b4d6ac055f8f16ac735a70036243bc4ea2334039.patch")
maintainer="KwonNam Son <kwon37xi@gmail.com>"

prepare() {
    patch -Np1 -i PACSTALL_patchesdir/b4d6ac055f8f16ac735a70036243bc4ea2334039.patch
}

build() {
    mkdir build
    cd build
    cmake ..
    make -j$(nproc)
}

install() {
    cd build
    sudo make install DESTDIR="/usr/src/pacstall/${name}"
}
