name="cutefish-qt-plugins-git"
gives="cutefish-qt-plugins"
version="0.3-1"
url="https://github.com/cutefishos/qt-plugins.git"
license="GPL-3.0"
build_depends="extra-cmake-modules ninja-build qttools5-dev-tools qtbase5-dev qtdeclarative5-dev qtquickcontrols2-5-dev libxcb-ewmh-dev qttools5-dev"
depends="libkf5windowsystem-dev libdbusmenu-qt5-dev libqt5xdg-dev qtquickcontrols2-5-dev"
description="Unify Qt application style of CutefishOS"

pkgver() {
    git ls-remote "${url}" main | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
    mkdir build
    cd build
}

build() {
    cmake ..
    make -j$(nproc)
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/cutefish-qt-plugins-git
}
