name="prismlauncher-git"
gives="prismlauncher"
url="https://github.com/PrismLauncher/PrismLauncher.git"
build_depends="qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools libqt5core5a libqt5network5 libqt5gui5 cmake ninja-build extra-cmake-modules zlib1g-dev openjdk-17-jdk libgl1-mesa-dev scdoc"
description="Custom launcher for Minecraft"
pkgver() {
    git ls-remote "${url}" develop | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
    git submodule update --init --recursive
}

build() {
    cmake -S . -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DENABLE_LTO=ON

    cmake --build build
}

install() {
    sudo DESTDIR="${pkgdir}" cmake --install build
}
