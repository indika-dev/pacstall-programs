name="viper4linux"
version="2.0"
url="https://github.com/SamarthH/Viper4LinuxForPacstall/releases/download/v1.0/Viper4LinuxForPacstall.zip"
depends="build-essential cmake libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev gstreamer1.0-tools"
description="A Port of Viper4Android to Linux, or in the words of noahbliss: Making Loonix sound good"
hash="fe85277ca63f8a99beb2c347b6d9a268eb783c601c8fcbb7d0366d4797ff9900"

prepare() {
  sudo mkdir -p "$STOWDIR/${name}/usr/lib/x86_64-linux-gnu/gstreamer-1.0"
  sudo mkdir -p "$STOWDIR/${name}/usr/local/bin"
  sudo mkdir -p "$STOWDIR/${name}/usr/lib"
  sudo mkdir -p "$STOWDIR/${name}/home/$USER/.config"
}

build() {
  cd gst-plugin-viperfx
  cmake -j$(nproc) .
  make -j$(nproc)
}

install() {
  #These are basically install instructions from https://github.com/Audio4Linux/Viper4Linux
  sudo cp libgstviperfx.so "$STOWDIR/${name}/usr/lib/x86_64-linux-gnu/gstreamer-1.0/"

  cd ..

  sudo cp "viperfx_core_binary/libviperfx_x64_linux.so" "$STOWDIR/${name}/usr/lib/libviperfx.so"

  cd Viper4Linux
  sudo cp -r viper4linux "$STOWDIR/${name}/home/$USER/.config/"

  sudo install -Dm755 viper -t "$STOWDIR/${name}/usr/bin"
}
